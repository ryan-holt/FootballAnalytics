from flask_restplus import fields
from restplus import api

# A players namespace to be used by the API in app.py
ns = api.namespace('players', description='Operations related to players')

# The player model to enforce inputs arguments from the API
player = ns.model('player',
                  {'team_code': fields.String(description='Team code of player', required=True, max_length=3),
                   'player_name': fields.String(description='Name of player', required=True, max_length=45),
                   'jersey_number': fields.Integer(description='Jersey number of player'),
                   'height': fields.String(description='Height of player in centimeters', required=True, max_length=5),
                   'position': fields.String(description='Position of player', required=True, max_length=45),
                   'weight': fields.Integer(description='Weight of player', required=True),
                   'year': fields.String(description='The year of player', required=True, max_length=45),
                   'hometown': fields.String(description='Hometown of player', required=True, max_length=45),
                   'high_school_team': fields.String(description='High School Team of player', required=True,
                                                     max_length=60),
                   'major': fields.List(fields.String, description='major', required=True, max_length=45)})

# Gets arguments from API's input data
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

# Formats the output json to display majors as a list
def convert_major_to_list(results):
    new_results = []
    for row in results:
        if not any(d['player_id'] == row['player_id']
                   and d['creation_date'] == row['creation_date'] for d in new_results):
            major_list = [row['major']]
            for r in results:
                if row['player_id'] == r['player_id'] and row['creation_date'] == r['creation_date'] and row['major'] \
                        != r['major']:
                    major_list.append(r['major'])
            row['major'] = major_list
            new_results.append(row)
    return tuple(new_results)
