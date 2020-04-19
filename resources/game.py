import MySQLdb
from flask import request
from flask_restplus import Resource, marshal

from models.game import game_stats, game, get_game_args, game_post_model, get_game_statistics_out_parameters
from models.play import penalty, format_results, play
from restplus import api, db

ns = api.namespace('game', description='Operations related to games')

@ns.route('/')
class GameList(Resource):
    """
    Manipulations with games.
    """

    @ns.expect(game_post_model, validate=True)
    @ns.response(code=404, description='Team code not found')
    @ns.response(code=500, description='Internal Server Error')
    @ns.response(code=201, description='Game created')
    def post(self):
        """
        Adds a game

        Use Case: This endpoint can be used by an admin to create a new game record. The endpoint checks if the
        provided team code for the home and away team already exist. If not, a failure message will be sent to the
        admin indicating that the team code does not exists.
        """
        data = request.json
        connection = db.engine.raw_connection()
        try:
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                args = get_game_args(data)
                cursor.callproc("addGame", args + [''])
                # Get out parameters
                cursor.execute('SELECT @_addGame_9')
                fail_msg = cursor.fetchall()[0]['@_addGame_9']
                if fail_msg:
                    return {'message': '{}'.format(fail_msg)}, 404
            connection.commit()
        except Exception as e:
            return {"message": str(e)}, 500
        finally:
            connection.close()
        return {'message': 'game has been created successfully.'}, 201


@ns.route('/<string:game_id>', doc={'params': {'game_id': 'A game ID'}})
class Game(Resource):
    """
    Manipulations with a specific game.
    """

    @ns.response(code=404, model=None, description='Game not found')
    @ns.response(code=200, model=game, description='Success')
    def get(self, game_id):
        """
        Gets game by id

        Use Case: This endpoint can be used by a client to view the details of a game by providing
        a game id. A message is returned to the client if the game id does not exist.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getGameById", [game_id])
            results = cursor.fetchall()
        if not results:
            return {'message': 'No game exists with the game ID: {}'.format(game_id)}, 404
        return marshal(results, game), 200


@ns.route('/<string:game_id>/stats', doc={'params': {'game_id': 'A game ID'}})
class Game(Resource):
    """
    Statistics for a specific game.
    """

    @ns.response(code=404, model=None, description='Game not found')
    @ns.response(code=200, model=game_stats, description='Success')
    def get(self, game_id):
        """
        Gets game statistics by id

        Use Case: This endpoint can be used by a client to view the statistics of a game by providing a game
        id. A message is returned to the client if the game id does not exist.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getGameStatsById", [game_id, '', '', '', '', '', '', '', ''])
            out_params = []
            results = cursor.fetchall()
            if not results:
                return {'message': 'No game exists with the game ID: {}'.format(game_id)}, 404
            for i in range(1, 9):
                cursor.execute('SELECT @_getGameStatsById_' + str(i))
                out_params.append(cursor.fetchall()[0]['@_getGameStatsById_' + str(i)])
            results = get_game_statistics_out_parameters(results, out_params)
        return marshal(results, game_stats), 200


@ns.route('/<int:game_id>/penalties', doc={'params': {'game_id': 'A game ID'}})
class GamePenaltyList(Resource):
    """
    Manipulations with a specific game's penalties.
    """

    @ns.response(code=404, description='Penalties not found')
    @ns.response(code=200, model=penalty, description='Success')
    def get(self, game_id):
        """
        Gets all penalties for a specific game

        Use Case: This endpoint can be used by a client to see a list of all penalties for a game by providing a
        game id. A message is returned to the client if the game id does not exist.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getPenaltiesByGameId", [game_id])
            results = cursor.fetchall()
            if not results:
                return {'message': 'Penalties not found for game ID: {}.'.format(game_id)}, 404
        return marshal(results, penalty), 200

@ns.route('/<int:game_id>/plays', doc={'params': {'game_id': 'A game ID'}})
class PlayGameList(Resource):
    """
    Manipulations with plays for a specific game.
    """

    @ns.response(code=200, model=play, description='Success')
    @ns.response(code=404, description='Plays not found')
    def get(self, game_id):
        """
        Gets all plays

        Use Case: This endpoint can be used by a client to see a list of plays for a game by providing a game id. A
        message is returned to the client if no plays exist for the provided game id.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getPlaysByGameId", [game_id])
            results = cursor.fetchall()
            if not results:
                return {'message': 'Plays not found for game ID: {}.'.format(game_id)}, 404
        results = format_results(results)
        return marshal(results, play), 200

