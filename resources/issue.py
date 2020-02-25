import MySQLdb
from flask import request, jsonify
from flask_restplus import Resource, fields

from restplus import api, db

ns = api.namespace('issues', description='Operations related to system issues')
client = api.model('Issue', 
                {
                    'clientUsername': fields.String(description='username of client who reported the issue', required=True, max_length=20),
                    'issueID': fields.Integer(description='id of the issue', required=True),
                    'description': fields.String(description='description of the issue', required=True, max_length=200)
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
        return jsonify(results)

@ns.route('/<int:issueID>')
class IssueID(Resource):
    def get(self, issueID):
        """
        Gets the specified issue by issue id
        """
        if issueID:
            with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("getIssueByID", [issueID])
                results = cursor.fetchall()
            if results:
                return jsonify(results)
            else:
                return {'message': 'no issues with such ID'}, 201

@ns.route('/<string:clientUsername>')
class IssueUsername(Resource):
    def get(self, clientUsername):
        """
        Gets the specified issue by client's username (reporter)
        """
        if clientUsername:
            with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("getIssuesByClientUsername", [clientUsername])
                results = cursor.fetchall()
            if results:
                return jsonify(results)
            else:
                return {'message': 'no issues found by client specified'}, 201