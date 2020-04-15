from flask_restplus import fields
from restplus import api

team = api.model('Team',
                 {'team_code': fields.String(description='Team code of team', required=True, max_length=3),
                  'team_name': fields.String(description='Name of team', required=True, max_length=45),
                  'hometown': fields.String(description='Hometown of team,', required=True, max_length=45),
                  'mascot': fields.String(description="Mascot of team", required=True, max_length=45),
                  'university': fields.String(description='University of team', required=True, max_length=45)
                  })


def get_team_args(data):
    return [data.get('team_code'),
            data.get('team_name'),
            data.get('hometown'),
            data.get('mascot'),
            data.get('university')]
