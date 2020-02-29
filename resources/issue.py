import MySQLdb
from flask import jsonify, make_response
from flask_restplus import Resource, fields

from restplus import api, db

ns = api.namespace('issues', description='Operations related to system issues')
issue = api.model('Issue',
                  {
                      'client_username': fields.String(description='username of client who reported the issue',
                                                       required=True, max_length=20),
                      'description': fields.String(description='description of the issue', required=True,
                                                   max_length=200)
                  })


@ns.route('/')
class IssueList(Resource):
    def get(self):
        """
        Gets all issues
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getIssues")
            results = cursor.fetchall()
        return make_response(jsonify(results), 200)


@ns.route('/<string:client_username>')
class IssueUsername(Resource):
    def get(self, client_username):
        """
        Gets issues by client's username (reporter)
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getIssuesByClientUsername", [client_username])
            results = cursor.fetchall()
        if not results:
            return make_response({'message': 'No issues exist for the client username: {}'.format(client_username)},
                                 404)
        return make_response(jsonify(results), 200)


@ns.route('/<int:issue_id>')
class IssueID(Resource):
    def get(self, issue_id):
        """
        Gets issue for specified issue id
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getIssueByID", [issue_id])
            results = cursor.fetchall()
        if not results:
            return make_response({'message': 'No issues exist for the issue id: {}'.format(issue_id)}, 404)
        return make_response(jsonify(results), 200)
