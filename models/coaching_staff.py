from flask_restplus import fields
from restplus import api

# A coaching staff namespace to be used by the API in app.py
ns = api.namespace('coaching_staff', description='Operations related to coaching staff')

# The coaching staff model to enforce inputs arguments from the API
coaching_staff = api.model('Coaching_staff',
                           {'team_code': fields.String(description='Team code of coaching staff', required=True,
                                                       max_length=3),
                            'first_name': fields.String(description='First name of coaching staff', required=True,
                                                        max_length=45),
                            'last_name': fields.String(description='Last name of coaching staff', required=True,
                                                       max_length=45),
                            'position': fields.String(description="Position of coaching staff", required=True,
                                                      max_length=100)
                            })

# Gets arguments from API's input data
def get_coaching_staff_args(data):
    return [data.get('team_code'),
            data.get('first_name'),
            data.get('last_name'),
            data.get('position')]
