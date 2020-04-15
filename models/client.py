from flask_restplus import fields
from restplus import api

client = api.model('Client',
                            {'username': fields.String(description='Username of client', required=True, max_length=20),
                             'password': fields.String(description='Password of client', required=True, max_length=20)})