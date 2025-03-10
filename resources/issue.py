import MySQLdb
from flask_restplus import Resource, marshal

from models.issue import issue, issue_parser
from restplus import api, db

ns = api.namespace('issues', description='Operations related to system issues')

@ns.route('/')
class IssueList(Resource):
    """
    Manipulations with issues.
    """

    @ns.marshal_list_with(issue)
    def get(self):
        """
        Gets all issues sorted by submission date

        Use Case: This endpoint can be used by an admin to see a list of all user submitted issues.
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

        Use Case: This endpoint can be used by an admin to view all issues submitted by a client sorted by
        submission date by providing a client's username. A message is returned to the admin if the provided username
        does not exist.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getIssuesByClientUsername", [client_username])
            results = cursor.fetchall()
        if not results:
            return {'message': 'No issues exist for the client username: {}'.format(client_username)}, 404
        return marshal(results, issue), 200

    @ns.expect(issue_parser, validate=True)
    @ns.response(code=201, description='Issue created')
    @ns.response(code=500, description='Internal Server Error')
    def post(self, client_username):
        """
        Adds a new issue by client username

        Use Case: This endpoint can be used by a client to create a new issue by providing data through a website form
        to be reviewed by the admins.
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

        Use Case: This endpoint can be used by an admin to view the details of a specific issue by providing the issue
        id. A message is returned to the admin if the provided issue id does not exist.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getIssueByID", [issue_id])
            results = cursor.fetchall()
        if not results:
            return {'message': 'No issues exist for the issue id: {}'.format(issue_id)}, 404
        return marshal(results, issue), 200
