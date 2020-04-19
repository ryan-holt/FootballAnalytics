from flask_restplus import fields, reqparse

from models.util import max_length
from restplus import api

# The issue model to enforce inputs arguments from the API
issue = api.model('Issue',
                  {
                      'client_username': fields.String(description='username of client who reported the issue',
                                                       required=True, max_length=20),
                      'description': fields.String(description='description of the issue', required=True,
                                                   max_length=200),
                      'submission_date': fields.DateTime(description='submission date of the issue')
                  })

# An issue parser to require a description argument from an issue form
issue_parser = reqparse.RequestParser(bundle_errors=True)
issue_parser.add_argument('description', required=True, type=max_length(200), location='form')
