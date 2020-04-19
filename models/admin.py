from flask_restplus import fields, reqparse

from models.util import is_int
from restplus import api

# The admin model to enforce inputs from the API
admin = api.model('Admin',
                  {'username': fields.String(description='Username of admin', required=True, max_length=20),
                   'password': fields.String(description='Password of admin', required=True, max_length=20),
                   'permission_level': fields.Integer(description='Permission level given to admin', required=True)})

# A parser for admin's permission level which is inputted from a form
admin_permission_level_parser = reqparse.RequestParser(bundle_errors=True)
admin_permission_level_parser.add_argument('new_permission_level', required=True, type=is_int(), location='form')

# Gets arguments from API's input data
def get_admin_args(data):
    return [data.get('username'),
            data.get('password'),
            data.get('permission_level')]
