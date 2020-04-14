import MySQLdb
from flask import request
from flask_restplus import Resource, fields, marshal

from restplus import api, db

ns = api.namespace('plays', description='Operations related to plays')

kick = api.model('kick',
                 {
                     'kicker': fields.Integer(description='Player ID of the kicker on the play.', required=False),
                     'kick_yardage': fields.Integer(description='Yardage length of the kick', required=True),
                     'kick_result': fields.String(
                         description='Kick Result. How a kickoff, punt or missed field goal ended. Options include '
                                     'returned (R), touchback including single points (T), out-of-bounds (O), blocked'
                                     ' (B), onside kick (ON), successful on-side kick (S), no yards (N), penalty '
                                     'before a return (P), whistle blown deadball (D) and missed (M) for a hit '
                                     'upright or crossbar deadball.',
                         required=False, max_length=2),
                 })

fumble = api.model('fumble',
                   {
                       'fum_player_id': fields.Integer(description='Player ID of player who fumbled the ball.'),
                       'rec_player_id': fields.Integer(description='Player ID of player who recovered a fumbled ball'),
                       'fumble_yardage': fields.Integer(description='Yardage gained or lost on a fumble return',
                                                        required=True),
                       'forced': fields.String(description=' Fumble Forced. If a fumble was forced on the play, Y is '
                                                           'noted. Otherwise NULL.', max_length=1)
                   })

player_pass = api.model('pass',
                        {
                            'quarterback_player_id': fields.Integer(
                                description='Player ID  of the quarterback on passing play'),
                            'pass_result': fields.String(description='Pass Result. Options include complete (C), '
                                                                     'incomplete (I), dropped (D), interception (IN), '
                                                                     'sacked (S) or QB scramble run (R).',
                                                         max_length=45)
                        })

penalty = api.model('penalty',
                    {
                        'player_id': fields.Integer(
                            description='Player ID  of player who committed the penalty'),
                        'penalty_yardage': fields.Integer(description='Yardage applied for an accepted penalty.'),
                        'penalty_type': fields.String(description='Yardage applied for an accepted penalty.',
                                                      max_length=45)
                    })

play = ns.model('play',
                {'game_id': fields.Integer(description='The game identification number', required=True),
                 'quarter': fields.Integer(description='Quarter of the game', required=True),
                 'time': fields.String(description='Time on the game clock', required=True, max_length=45),
                 'play_null': fields.String(description='If there was a penalty on the play and play did not count, or '
                                                        'it is a non-play, play is null (Y). Otherwise (N)',
                                            required=True, max_length=1),
                 'field_position': fields.Integer(description=' Field position of the ball by yard line, denoted as'
                                                              ' negative or plus', required=True),
                 'description': fields.String(description='Text summary of the play, for quick reference to player '
                                                          'names involved in the play.', max_length=255),
                 'team_possession': fields.String(description='Team with possession of ball at beginning of the play',
                                                  required=True, max_length=3),
                 'yardage_gained': fields.Integer(description='Yardage gained or lost on the play', max_length=45),
                 'down': fields.Integer(description='The number of the down', required=True),
                 'first_down_distance': fields.Integer(description=' Distance needed for a first down.', required=True),
                 'run_pass_flag': fields.String(description=' Denotes if it was a run (R), pass (P) or no play (N) (for'
                                                            ' pre-snap penalties).', max_length=1),
                 'ball_position': fields.String(description='Ball position on the field, either on the team’s own side'
                                                            ' of half or the opponent’s side of half, noted with team '
                                                            'code.', required=True, max_length=3),
                 'out_of_bounds': fields.String(description='Denotes if the play finished out-of-bounds (Y) or not '
                                                            '(NULL).', max_length=1),
                 'ball carrier/targeted receiver': fields.Integer(
                     description='Player ID of the ball carrier or targeted receiver', required=True),
                 'kick': fields.Nested(kick),
                 'primary_defence': fields.Integer(description='Player ID of the primary defence for the play.',
                                                   required=False),
                 'secondary_defence': fields.Integer(description='Player ID of the secondary defence for the play.',
                                                     required=False),
                 'hurries_quarterback': fields.Integer(description='Player ID of defender credited with a QB hurry on '
                                                                   'the play', required=False),
                 'calls_timeout': fields.String(description='The team code indicating the team called a timeout before '
                                                            'this play was run', required=False, max_length=3),
                 'fumble': fields.Nested(fumble),
                 'pass': fields.Nested(player_pass),
                 'penalties': fields.List(fields.Nested(penalty))
                 })


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
                    for pen in penalties:
                        if pen['player_id'] is not None:
                            cursor.callproc("addPenalty",
                                            [play_id, pen['player_id'], pen['penalty_yardage'], pen['penalty_type'],
                                             ''])
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


def get_play_args(data):
    kick_arg = data.get('kick')
    fumble_arg = data.get('fumble')
    player_pass_arg = data.get('pass')
    kick_list, fumble_list, pass_list = [None, None, None], [None, None, None, None], [None, None]
    if kick_arg:
        kick_list = [kick_arg.get('kicker'), kick_arg.get('kick_yardage'), kick_arg.get('kick_result')]
    if fumble_arg:
        fumble_list = [fumble_arg.get('fum_player_id'), fumble_arg.get('rec_player_id'),
                       fumble_arg.get('fumble_yardage'), fumble_arg.get('forced')]
    if player_pass_arg:
        pass_list = [player_pass_arg.get('quarterback_player_id'), player_pass_arg.get('pass_result')]

    return [data.get('game_id'),
            data.get('quarter'),
            data.get('time'),
            data.get('play_null'),
            data.get('field_position'),
            data.get('description'),
            data.get('team_possession'),
            data.get('yardage_gained'),
            data.get('down'),
            data.get('first_down_distance'),
            data.get('run_pass_flag'),
            data.get('ball_position'),
            data.get('out_of_bounds'),
            data.get('ball carrier/targeted receiver')] + \
           kick_list + \
           fumble_list + \
           pass_list + \
           [data.get('primary_defence'),
            data.get('secondary_defence'),
            data.get('hurries_quarterback'),
            data.get('calls_timeout')]


def format_results(results):
    results = convert_penalty_to_list(results)
    for r in results:
        if r['f.play_id'] is not None:
            r['fumble'] = {'fum_player_id': r['fum_player_id'], 'rec_player_id': r['rec_player_id'],
                           'fumble_yardage': r['fumble_yardage'], 'forced': r['forced']}
        else:
            r['fumble'] = []
        if r['pass.play_id'] is not None:
            r['pass'] = {'quarterback_player_id': r['pass.player_id'], 'pass_result': r['pass_result']}
        else:
            r['pass'] = []
        if r['ik.play_id'] is not None:
            r['kick'] = {'kicker': r['ik.player_id'], 'kick_yardage': r['kick_yardage'],
                         'kick_result': r['kick_result']}
        else:
            r['kick'] = []
        r['ball carrier/targeted receiver'] = r.pop('player_id')
        r['hurries_quarterback'] = r.pop('hq.player_id')
        r['primary_defence'] = r.pop('ipd.player_id')
        r['secondary_defence'] = r.pop('isd.player_id')
        r['calls_timeout'] = r.pop('team_code')
    return results


def convert_penalty_to_list(results):
    new_results = []
    for row in results:
        if not any(d['play_id'] == row['play_id'] for d in new_results):
            penalty_list = [{'player_id': row['pen.player_id'],
                             'penalty_yardage': row['penalty_yardage'],
                             'penalty_type': row['penalty_type']
                             }]
            for r in results:
                if row['play_id'] == r['play_id'] and row['penalty_id'] != r['penalty_id']:
                    penalty_list.append({'player_id': r['pen.player_id'],
                                         'penalty_yardage': r['penalty_yardage'],
                                         'penalty_type': r['penalty_type']
                                         })
            if penalty_list[0]['player_id'] is not None:
                row['penalties'] = penalty_list
            else:
                row['penalties'] = []
            new_results.append(row)
    return tuple(new_results)
