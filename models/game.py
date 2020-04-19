from flask_restplus import fields

from restplus import api

# A game namespace to be used by the API in app.py
ns = api.namespace('game', description='Operations related to games')

# The game stats model to enforce inputs arguments from the API
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

# The game model to enforce inputs arguments from the API
game = ns.model('game',
                {'home_team': fields.String(description='Team code of home team', required=True, max_length=3),
                 'away_team': fields.String(description='Team code of away team', required=True, max_length=3),
                 'stadium': fields.String(description='Stadium of play for the game', required=True, max_length=100),
                 'location': fields.String(description='Location of the game', required=True, max_length=100),
                 'attendance': fields.Integer(description='The attendance at the game'),
                 'duration': fields.Integer(description='Game duration', required=True, max_length=45),
                 'start_time': fields.String(description='The starting time of the game', required=True)})

# The game post model to enforce inputs arguments from the API
game_post_model = ns.model('game',
                {'home_team': fields.String(description='Team code of home team', required=True, max_length=3),
                 'home_points': fields.Integer(description='Number of points for the home team', required=True),
                 'away_team': fields.String(description='Team code of away team', required=True, max_length=3),
                 'away_points': fields.Integer(description='Number of points for the away team', required=True),
                 'stadium': fields.String(description='Stadium of play for the game', required=True, max_length=100),
                 'location': fields.String(description='Location of the game', required=True, max_length=100),
                 'attendance': fields.Integer(description='The attendance at the game'),
                 'duration': fields.Integer(description='Game duration', required=True, max_length=45),
                 'start_time': fields.String(description='The starting time of the game', required=True)})

# Gets arguments from API's input data
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

# Gets the out parameters for the get game statistics stored procedure
def get_game_statistics_out_parameters(results, out_params):
    results[0]['number_of_completed_passes'] = out_params[0]
    results[0]['number_of_failed_passes'] = out_params[1]
    results[0]['average_first_down_distance'] = out_params[2]
    results[0]['number_of_fumbles'] = out_params[3]
    results[0]['number_of_penalties'] = out_params[4]
    results[0]['number_of_kicks'] = out_params[5]
    results[0]['average_kick_yardage'] = out_params[6]
    results[0]['longest_kicker_name'] = out_params[7]
    return results