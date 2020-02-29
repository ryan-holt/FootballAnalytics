import MySQLdb
from flask import request, jsonify, make_response
from flask_restplus import Resource, fields

from restplus import api, db

ns = api.namespace('players', description='Operations related to players')
player = ns.model('Player',
                  {'team_code': fields.String(description='Team code of player', required=True, max_length=3),
                   'player_name': fields.String(description='Name of player', required=True, max_length=45),
                   'jersey_number': fields.Integer(description='Jersey number of player'),
                   'height': fields.String(description='Height of player in centimeters', required=True, max_length=5),
                   'position': fields.String(description='Position of player', required=True, max_length=45),
                   'weight': fields.Integer(description='Weight of player', required=True),
                   'year': fields.String(description='The year of player', required=True, max_length=45),
                   'hometown': fields.String(description='Hometown of player', required=True, max_length=45),
                   'high_school_team': fields.String(description='High School Team of player', max_length=60)
                   })


@ns.route('/')
class PlayerList(Resource):
    def get(self):
        """Gets all players"""
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getPlayers")
            results = cursor.fetchall()
        return make_response(jsonify(results), 200)

    @ns.expect(player, validate=True)
    def post(self):
        """Adds a player to an existing team"""
        data = request.json
        connection = db.engine.raw_connection()
        try:
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                args = get_player_args(data)
                cursor.callproc("addPlayer", args)
                results = cursor.fetchall()
                cursor.close()
                connection.commit()
                if not results:
                    return make_response({'message': 'The team code {} does not exist.'.format(args[0])}, 404)
        except Exception as e:
            return make_response({"message": str(e)}, 500)
        finally:
            connection.close()
        return make_response({'message': 'player has been created successfully.'}, 201)


@ns.route('/<int:player_id>')
class Player(Resource):
    def get(self, player_id):
        """Gets player by id"""
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getPlayerByID", [player_id])
            results = cursor.fetchall()
        if not results:
            return make_response({'message': 'No player exists with the id: {}'.format(player_id)}, 404)
        return make_response(jsonify(results), 200)

    @ns.expect(player, validate=True)
    def put(self, player_id):
        """Updates an existing player's information"""
        data = request.json
        connection = db.engine.raw_connection()
        try:
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("updatePlayerById", get_player_args(data) + [player_id, ''])
                # Get out parameter
                cursor.execute('SELECT @_updatePlayerById_10')
                fail_msg = cursor.fetchall()[0]['@_updatePlayerById_10']
            if fail_msg:
                return make_response({'message': '{}'.format(fail_msg)}, 404)
            connection.commit()
        except Exception as e:
            return make_response({"message": str(e)}, 500)
        finally:
            connection.close()
        return make_response({'message': 'player {} has been updated successfully.'.format(player_id)}, 201)


@ns.route('/<int:player_id>/history')
class PlayerHistory(Resource):
    def get(self, player_id):
        """Gets every record for player, showing changes over time"""
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getPlayerHistory", [player_id])
            results = cursor.fetchall()
        if not results:
            return make_response({'message': 'No player exists with the id: {}'.format(player_id)}, 404)
        return make_response(jsonify(results), 200)


def get_player_args(data):
    return [data.get('team_code'),
            data.get('player_name'),
            data.get('jersey_number'),
            data.get('height'),
            data.get('position'),
            data.get('weight'),
            data.get('year'),
            data.get('hometown'),
            data.get('high_school_team')]
