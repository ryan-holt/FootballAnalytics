import MySQLdb
from flask import request
from flask_restplus import Resource, marshal

from models.client import client
from models.player import player, convert_major_to_list, get_player_args
from restplus import api, db

ns = api.namespace('players', description='Operations related to players')

@ns.route('/')
class PlayerList(Resource):
    """
    Manipulations with players.
    """

    @ns.marshal_list_with(player)
    def get(self):
        """
        Gets all players

        Use Case: This endpoint can be used by a client to see a list of players from all university teams.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getPlayers")
            results = cursor.fetchall()
        results = convert_major_to_list(results)
        return results, 200

    @ns.expect(player, validate=True)
    @ns.response(code=404, description='Team code not found')
    @ns.response(code=500, description='Internal Server Error')
    @ns.response(code=201, description='Player created')
    def post(self):
        """
        Adds a player to an existing team

        Use Case: This endpoint can be used by an admin to create a new player record. The endpoint checks if the
        team code of the provided player already exists. A failure message will be sent to the
        client if the team code does not exists.

        For each listed major, a record will be created in the majors_in table.
        """
        data = request.json
        connection = db.engine.raw_connection()
        try:
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                args = get_player_args(data)
                cursor.callproc("addPlayer", args + ['', '', ''])
                # Get out parameters
                cursor.execute('SELECT @_addPlayer_9')
                fail_msg = cursor.fetchall()[0]['@_addPlayer_9']
                if fail_msg:
                    return {'message': '{}'.format(fail_msg)}, 404
                cursor.execute('SELECT @_addPlayer_10')
                player_id = cursor.fetchall()[0]['@_addPlayer_10']
                cursor.execute('SELECT @_addPlayer_11')
                creation_date = cursor.fetchall()[0]['@_addPlayer_11']
                for major in data.get('major'):
                    cursor.callproc("addMajor", [player_id, creation_date, major])
            connection.commit()
        except Exception as e:
            return {"message": str(e)}, 500
        finally:
            connection.close()
        return {'message': 'player has been created successfully.'}, 201


@ns.route('/<int:player_id>', doc={'params': {'player_id': 'A player ID'}})
class Player(Resource):
    """
    Manipulations with a specific player.
    """

    @ns.response(code=200, model=player, description='Success')
    @ns.response(code=404, description='Player not found')
    def get(self, player_id):
        """
        Gets player by id

        Use Case: This endpoint can be used by a client to view the details of a player by providing the player id.
        A message is returned to the client if the player id does not exist.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getPlayerByID", [player_id])
            results = cursor.fetchall()
        if not results:
            return {'message': 'No player exists with the id: {}'.format(player_id)}, 404
        results = convert_major_to_list(results)
        return marshal(results, player), 200

    @ns.expect(player, validate=True)
    @ns.response(code=400, description='Bad request')
    @ns.response(code=500, description='Internal Server Error')
    @ns.response(code=201, description='Player created')
    def put(self, player_id):
        """
        Update an existing player's details by ID.

        Use Case: This endpoint can be used by the admin to apply modifications to a player. In the database a
        new player record is created with the same playerID but a different creation date to keep player history. A
        failure message is returned if the player id provided does not exist.
        """
        data = request.json
        connection = db.engine.raw_connection()
        try:
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("updatePlayerById", get_player_args(data) + [player_id, '', ''])
                cursor.execute('SELECT @_updatePlayerById_10')
                fail_msg = cursor.fetchall()[0]['@_updatePlayerById_10']
                if fail_msg:
                    return {'message': '{}'.format(fail_msg)}, 400
                cursor.execute('SELECT @_updatePlayerById_11')
                creation_date = cursor.fetchall()[0]['@_updatePlayerById_11']
                for major in data.get('major'):
                    cursor.callproc("addMajor", [player_id, creation_date, major])
            connection.commit()
        except Exception as e:
            return {"message": str(e)}, 500
        finally:
            connection.close()
        return {'message': 'player {} has been updated successfully.'.format(player_id)}, 201


@ns.route('/<int:player_id>/follows', doc={'params': {'player_id': 'A player ID'}})
class Player(Resource):
    """
    Manipulations with a specific player's followers.
    """

    @ns.response(code=200, model=client, description='Success')
    @ns.response(code=404, description='Followers not found')
    def get(self, player_id):
        """
        Gets a player's followers by player ID

        Use Case: This endpoint can be used by an admin to view the list of clients that follow a specified player by
        providing a player id. A message is sent to the admin if the player id does not exist.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getClientsFollowedByPlayer", [player_id])
            results = cursor.fetchall()
        if not results:
            return {'message': 'No clients follow player with the id: {}'.format(player_id)}, 404
        return marshal(results, client), 200


@ns.route('/<int:player_id>/history', doc={'params': {'player_id': 'A player ID'}})
class PlayerHistory(Resource):
    """
    Manipulations with a specific player's history.
    """

    @ns.response(code=200, model=player, description='Success')
    @ns.response(code=404, description='Player history not found')
    def get(self, player_id):
        """
        Gets player history by ID

        Use Case: This endpoint can be used by a client to view every record for a player by ID, showing
        changes over time (history of player). A message is returned to the client if the player id does not exist.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getPlayerHistory", [player_id])
            results = cursor.fetchall()
        if not results:
            return {'message': 'No player exists with the id: {}'.format(player_id)}, 404
        results = convert_major_to_list(results)
        return marshal(results, player), 200

