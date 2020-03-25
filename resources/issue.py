import MySQLdb
from flask_restplus import Resource, fields, reqparse, marshal

from restplus import api, db

ns = api.namespace('issues', description='Operations related to system issues')
issue = api.model('Issue',
                  {
                      'client_username': fields.String(description='username of client who reported the issue',
                                                       required=True, max_length=20),
                      'description': fields.String(description='description of the issue', required=True,
                                                   max_length=200),
                      'submission_date': fields.DateTime(description='submission date of the issue')
                  })


def max_length(max_len):
    def validate(s):
        if len(s) <= max_len:
            return s
        raise ValueError("String must be at most %i characters long" % max_len)
    return validate


issue_parser = reqparse.RequestParser(bundle_errors=True)
issue_parser.add_argument('description', required=True, type=max_length(200), location='form')


@ns.route('/')
class IssueList(Resource):
    """
    Manipulations with issues.
    """

    @ns.marshal_list_with(issue)
    def get(self):
        """
        Gets all issues sorted by submission date

        Use Case: An admin wants to see a list of all user submitted issues for the football analytics website.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getIssues")
            results = cursor.fetchall()
        return results, 200


@ns.route('/<string:client_username>', doc={'params': {'client_username': 'A client username'}})
class IssueUsername(Resource):
    """
    Manipulations with issues for a specific client.
    """

    @ns.response(code=200, model=issue, description='Success')
    @ns.response(code=404, model=None, description='Issues not found')
    def get(self, client_username):
        """
        Gets issues submitted by client's username, sorted by date

        Return's all issues submitted by a client sorted by submission date.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getIssuesByClientUsername", [client_username])
            results = cursor.fetchall()
        if not results:
            return {'message': 'No issues exist for the client username: {}'.format(client_username)}, 404
        return marshal(results, issue), 200

    @ns.expect(issue_parser, validate=True)
    @ns.response(code=500, description='Internal Server Error')
    def post(self, client_username):
        """
        Adds a new issue by client username

        Use Case: A user finds an issue with the website and submits it for review by admins.
        """
        data = issue_parser.parse_args()
        description = data['description']
        connection = db.engine.raw_connection()
        try:
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("addIssue", [client_username, description])
                cursor.close()
                connection.commit()
            return {'message': 'issue has been created successfully.'}, 201
        except Exception as e:
            return {"message": str(e)}, 500
        finally:
            connection.close()


@ns.route('/<int:issue_id>', doc={'params': {'issue': 'An issue ID'}})
class IssueID(Resource):
    @ns.response(code=200, model=issue, description='Success')
    @ns.response(code=404, model=None, description='Issue not found')
    def get(self, issue_id):
        """
        Gets issue for specified issue ID

        Return's an issue's details by issue ID.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getIssueByID", [issue_id])
            results = cursor.fetchall()
        if not results:
            return {'message': 'No issues exist for the issue id: {}'.format(issue_id)}, 404
        return marshal(results, issue), 200
