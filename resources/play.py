import MySQLdb
from flask import request
from flask_restplus import Resource, marshal

from restplus import db
from models.play import play, format_results, get_play_args, ns


@ns.route('/')
class PlayList(Resource):
    """
    Manipulations with plays.
    """

    @ns.expect(play, validate=True)
    @ns.response(code=201, description='Play created')
    @ns.response(code=404, description='Team code not found')
    @ns.response(code=500, description='Internal Server Error')
    def post(self):
        """
        Adds a play to an existing game.

        Use Case: This endpoint is used by an admin to create a new play record for a game. The endpoints checks if the
        player_ids, team code, and game_id already exists. If not, a failure message will be sent to the
        admin indicating which fields do not exist. For each listed penalty a record will be created in the penalty
        table.

        When creating new records in relations such as penalty that require both a player_id and creation
        date the database will use the most recent creation date, since we cannot expect admins to know the creation
        date of a player.
        """
        data = request.json
        connection = db.engine.raw_connection()
        try:
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                args = get_play_args(data)
                cursor.callproc("addPlayByGameId", args + ['', ''])
                # Get out parameters
                cursor.execute('SELECT @_addPlayByGameId_27')
                fail_msg = cursor.fetchall()[0]['@_addPlayByGameId_27']
                if fail_msg:
                    return {'message': '{}'.format(fail_msg)}, 400
                cursor.execute('SELECT @_addPlayByGameId_28')
                play_id = cursor.fetchall()[0]['@_addPlayByGameId_28']
                penalties = data.get('penalties')
                if penalties:
                    for p in penalties:
                        if p['player_id'] is not None:
                            cursor.callproc("addPenalty",
                                            [play_id, p['player_id'], p['penalty_yardage'], p['penalty_type'], ''])
                            cursor.execute('SELECT @_addPenalty_4')
                            fail_msg = cursor.fetchall()[0]['@_addPenalty_4']
                            if fail_msg:
                                connection.rollback()
                                return {'message': '{}'.format(fail_msg)}, 400
            connection.commit()
        except Exception as e:
            return {"message": str(e)}, 500
        finally:
            connection.close()
        return {'message': 'play has been created successfully.'}, 201


@ns.route('/<int:play_id>', doc={'params': {'play_id': 'A play ID'}})
class Play(Resource):
    """
    Manipulations with a specific play.
    """

    @ns.response(code=200, model=play, description='Success')
    @ns.response(code=404, description='Play not found')
    def get(self, play_id):
        """
        Gets play by id

        Use Case: This endpoint can be used by a client to view the details of a play by providing a play id. A message
        is returned to the client if no play exists for the provided play id.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getPlayById", [play_id])
            results = cursor.fetchall()
        if not results:
            return {'message': 'No play exists with the id: {}'.format(play_id)}, 404
        results = format_results(results)
        return marshal(results, play), 200
