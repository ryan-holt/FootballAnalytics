from flask_restplus import Api
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()
api = Api(version='1.0', title='Football Analytics API',
          description='A Flask RestPlus powered API for football analytics')
