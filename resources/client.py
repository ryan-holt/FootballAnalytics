import MySQLdb
from flask import request, jsonify, make_response
from flask_restplus import Resource, fields

from restplus import api, db

ns = api.namespace('clients', description='Operations related to clients')
client = api.model('Client', {'username': fields.String(description='Username of client', required=True, max_length=20),
                              'password': fields.String(description='Password of client', required=True,
                                                        max_length=20)})


@ns.route('/')
class ClientList(Resource):
    def get(self):
        """
        Gets all clients
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getClients")
            results = cursor.fetchall()
        return make_response(jsonify(results), 200)

    @ns.expect(client, validate=True)
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
        except Exception as e:
            return make_response({"message": str(e)}, 500)
        finally:
            connection.close()
        return make_response({'message': 'client has been created successfully.'}, 201)


@ns.route('/<string:username>')
class Client(Resource):
    def get(self, username):
        """
        Gets the specified client
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getClientByUsername", [username])
            results = cursor.fetchall()
        if not results:
            return make_response({'message': 'No client exists with the username: {}'.format(username)}, 404)
        return make_response(jsonify(results), 200)
