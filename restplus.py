from flask_restplus import Api
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()
api = Api(version='1.0', title='Football Analytics API',
          description='#### A REST API for university football analytics.\n'
                      "####  \n"
                      '#### Team Members:\n'
                      'Harsohail Brar (30041921) - T01\n'
                      'Ryan Holt         (30038609) - T01\n'
                      'Gary Wu           (30038110) - T01')
