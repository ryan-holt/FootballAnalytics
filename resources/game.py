import MySQLdb
from flask import request
from flask_restplus import Resource, fields, marshal

from resources.play import penalty, format_results, play
from restplus import api, db

ns = api.namespace('game', description='Operations related to games')
game_stats = api.model('game_stats',
                      {'home_team': fields.String(description='Team code of home team', required=True, max_length=3),
                       'home_points': fields.Integer(description='Number of points for the home team', required=True),
                       'away_team': fields.String(description='Team code of away team', required=True, max_length=3),
                       'away_points': fields.Integer(description='Number of points for the away team', required=True),
                       'number_of_completed_passes': fields.Integer(
                           description='Number of passes with a result of complete (C).'),
                       'number_of_failed_passes': fields.Integer(
                           description='Number of passes with a result other than complete (C).'),
                       'average_first_down_distance': fields.Float(
                           description='The average distance to the first down'),
                       'number_of_fumbles': fields.Integer(description='Number of fumbles for the game'),
                       'number_of_penalties': fields.Integer(description='Number of penalties for the game'),
                       'number_of_kicks': fields.Integer(description='Number of kicks for the game'),
                       'average_kick_yardage': fields.Float(description='Average kicker yardage'),
                       'longest_kicker_name': fields.String(description='Name of kicker with longest kick',
                                                            max_length=45)
                       })

game = ns.model('game',
                {'home_team': fields.String(description='Team code of home team', required=True, max_length=3),
                 'away_team': fields.String(description='Team code of away team', required=True, max_length=3),
                 'stadium': fields.String(description='Stadium of play for the game', required=True, max_length=100),
                 'location': fields.String(description='Location of the game', required=True, max_length=100),
                 'attendance': fields.Integer(description='The attendance at the game'),
                 'duration': fields.Integer(description='Game duration', required=True, max_length=45),
                 'start_time': fields.String(description='The starting time of the game', required=True)})


# TODO NOTE: the datetime has to follow the SQL format to work, not the default flask restplus DateTime


@ns.route('/')
class GameList(Resource):
    """
    Manipulations with games.
    """

    @ns.expect(game, validate=True)
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
            results[0]['number_of_completed_passes'] = out_params[0]
            results[0]['number_of_failed_passes'] = out_params[1]
            results[0]['average_first_down_distance'] = out_params[2]
            results[0]['number_of_fumbles'] = out_params[3]
            results[0]['number_of_penalties'] = out_params[4]
            results[0]['number_of_kicks'] = out_params[5]
            results[0]['average_kick_yardage'] = out_params[6]
            results[0]['longest_kicker_name'] = out_params[7]
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

def get_game_args(data):
    return [data.get('home_team'),
            data.get('home_points'),
            data.get('away_team'),
            data.get('away_points'),
            data.get('stadium'),
            data.get('location'),
            data.get('attendance'),
            data.get('duration'),
            data.get('start_time')]
