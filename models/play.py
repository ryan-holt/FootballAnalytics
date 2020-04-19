from flask_restplus import fields
from restplus import api

# The kick model to enforce inputs arguments from the API
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

# The fumble model to enforce inputs arguments from the API
fumble = api.model('fumble',
                   {
                       'fum_player_id': fields.Integer(description='Player ID of player who fumbled the ball.'),
                       'rec_player_id': fields.Integer(description='Player ID of player who recovered a fumbled ball'),
                       'fumble_yardage': fields.Integer(description='Yardage gained or lost on a fumble return',
                                                        required=True),
                       'forced': fields.String(description=' Fumble Forced. If a fumble was forced on the play, Y is '
                                                           'noted. Otherwise NULL.', max_length=1)
                   })

# The player pass model to enforce inputs arguments from the API
player_pass = api.model('pass',
                        {
                            'quarterback_player_id': fields.Integer(
                                description='Player ID  of the quarterback on passing play'),
                            'pass_result': fields.String(description='Pass Result. Options include complete (C), '
                                                                     'incomplete (I), dropped (D), interception (IN), '
                                                                     'sacked (S) or QB scramble run (R).',
                                                         max_length=45)
                        })

# The penalty model to enforce inputs arguments from the API
penalty = api.model('penalty',
                    {
                        'player_id': fields.Integer(
                            description='Player ID  of player who committed the penalty'),
                        'penalty_yardage': fields.Integer(description='Yardage applied for an accepted penalty.'),
                        'penalty_type': fields.String(description='Yardage applied for an accepted penalty.',
                                                      max_length=45)
                    })

# A plays namespace to be used by the API in app.py
ns = api.namespace('plays', description='Operations related to plays')

# The plays model to enforce inputs arguments from the API
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

# Gets arguments from API's input data
def get_play_args(data):
    # Get all the data from a data object such as JSON
    kick_arg = data.get('kick')
    fumble_arg = data.get('fumble')
    player_pass_arg = data.get('pass')

    # Create empty lists for kick, fumble, and pass
    kick_list, fumble_list, pass_list = [None, None, None], [None, None, None, None], [None, None]

    # If there was a kick argument, get the data regarding the kick from the JSON and add it to the list
    if kick_arg:
        kick_list = [kick_arg.get('kicker'), kick_arg.get('kick_yardage'), kick_arg.get('kick_result')]
    # If there was a fumble argument, get the data regarding the fumble from the JSON and add it to the list
    if fumble_arg:
        fumble_list = [fumble_arg.get('fum_player_id'), fumble_arg.get('rec_player_id'),
                       fumble_arg.get('fumble_yardage'), fumble_arg.get('forced')]
    # If there was a player pass argument, get the data regarding the player pass from the JSON and add it to the list
    if player_pass_arg:
        pass_list = [player_pass_arg.get('quarterback_player_id'), player_pass_arg.get('pass_result')]

    # Return the data of the play
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

# Formats the output json to display fumbles, passes and kicks as nested jsons
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

# Formats the output json to display penalties as a list
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
