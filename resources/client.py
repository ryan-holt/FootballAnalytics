import MySQLdb
from flask import request, jsonify
from flask_restplus import Resource, fields

from restplus import api, db

ns = api.namespace('clients', description='Operations related to clients')
client = api.model('Client', {'username': fields.String(description='the username', required=True, max_length=20),
                   'password': fields.String(description='the password', required=True, max_length=20)})


@ns.route('/')
class ClientList(Resource):
    def get(self):
        """
        Gets all clients
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getClients")
            results = cursor.fetchall()
        return jsonify(results)

    @api.expect(client, validate=True)
    def post(self):
        """
        Adds a new client
        """
        data = request.json
        name = data.get('username')
        password = data.get('password')
        connection = db.engine.raw_connection()
        try:
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("addClient", [name, password])
                connection.commit()
        finally:
            connection.close()
        return {'message': 'client has been created successfully.'}, 201



@ns.route('/<string:username>')
class Client(Resource):
    def get(self, username):
        """
        Gets the specified client
        """
        if username:
            with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("getClientByUsername", [username])
                results = cursor.fetchall()
            return jsonify(results)

    @api.expect(client, validate=True)
    def put(self, username):
        """
        Updates the username of the specified client
        """
        data = request.json
        new_username = data.get('username')
        password = data.get('password')
        connection = db.engine.raw_connection()
        try:
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("updateClientUsername", [username, new_username, password])
                #TODO find way to see if it actually updated anyting in the query
                connection.commit()
        except:
            return {'message': 'failed to update client username.'}, 201
        finally:
            connection.close()
        return {'message': 'client username has been updated successfully.'}, 201


