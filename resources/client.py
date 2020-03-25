import MySQLdb
from flask import request
from flask_restplus import Resource, marshal

from resources.player import player, client, convert_major_to_list
from restplus import api, db

ns = api.namespace('clients', description='Operations related to clients')

@ns.route('/')
class ClientList(Resource):
    """
    Manipulations with clients.
    """
    @ns.marshal_list_with(client)
    def get(self):
        """
        Gets all clients

        Use Case: An admin can use this endpoint to view a list of clients.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getClients")
            results = cursor.fetchall()
        return results, 200

    @ns.expect(client, validate=True)
    @ns.response(code=201, description='Client created')
    @ns.response(code=400, description='Client already exists')
    @ns.response(code=500, description='Internal Server Error')
    def post(self):
        """
        Adds a new client

        Use Case: This endpoint is used by a new client to create a new client record given a username and password
        from a sign up form. A failure message will be sent to the user if the provided username is already taken.
        """
        data = request.json
        name = data.get('username')
        password = data.get('password')
        connection = db.engine.raw_connection()
        try:
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("addClient", [name, password, ''])
                # Get out parameter
                cursor.execute('SELECT @_addClient_2')
                fail_msg = cursor.fetchall()[0]['@_addClient_2']
            if fail_msg:
                return {'message': '{}'.format(fail_msg)}, 400
            connection.commit()
        except Exception as e:
            return {"message": str(e)}, 500
        finally:
            connection.close()
        return {'message': 'client has been created successfully.'}, 201


@ns.route('/<string:username>', doc={'params': {'username': 'A client username'}})
class Client(Resource):
    """
    Manipulations with a specific client.
    """
    @ns.response(code=200, model=client, description='Success')
    @ns.response(code=404, description='Client not found')
    def get(self, username):
        """
        Gets client by username

        Use Case: This endpoint can be used by an admin to view the details of a client by providing
        a client's username. A failure message is returned to the admin if the username provided does
        not exist.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getClientByUsername", [username])
            results = cursor.fetchall()
        if not results:
            return {'message': 'No client exists with the username: {}'.format(username)}, 404
        return marshal(results, client), 200


@ns.route('/<string:username>/follows', doc={'params': {'username': 'A client username'}})
class ClientFollows(Resource):
    """
    Manipulations with players that a specific client follows.
    """

    @ns.response(code=200, model=player, description='Success')
    @ns.response(code=404, description='Players not found')
    def get(self, username):
        """
        Gets the players a client follows by client username

        Use Case: This endpoint is used by a client to see which players they follow. A message is
        returned to the client if they do not follow any players.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getPlayersFollowedByClient", [username])
            results = cursor.fetchall()
        if not results:
            return {'message': 'No players are followed by client: {}'.format(username)}, 404
        results = convert_major_to_list(results)
        return marshal(results, player), 200
