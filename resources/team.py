import MySQLdb
from flask import request, jsonify, make_response
from flask_restplus import Resource, fields

from restplus import api, db

ns = api.namespace('team', description='Operations related to teams')
team = api.model('Team',
                 {'team_code': fields.String(description='Team code of team', required=True, max_length=3),
                  'team_name': fields.String(description='Name of team', required=True, max_length=45),
                  'hometown': fields.String(description='Hometown of team,', required=True, max_length=45),
                  'mascot': fields.String(description="Mascot of team", required=True, max_length=45),
                  'university': fields.String(description='University of team', required=True, max_length=45)
                  })


@ns.route('/')
class TeamList(Resource):
    def get(self):
        """Gets all teams"""
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getTeams")
            results = cursor.fetchall()
        return make_response(jsonify(results), 200)

    @ns.expect(team, validate=True)
    def post(self):
        """Adds a new team"""
        data = request.json
        connection = db.engine.raw_connection()
        try:
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("addTeam", get_team_args(data))
                connection.commit()
        except Exception as e:
            return make_response({"message": str(e)}, 500)
        finally:
            connection.close()
        return make_response({'message': 'team has been created successfully.'}, 201)


@ns.route('/<string:team_code>')
class Team(Resource):
    def get(self, team_code):
        """Gets a team by team code"""
        if team_code:
            with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("getTeamByTeamCode", [team_code])
                results = cursor.fetchall()
            return make_response(jsonify(results), 200)


def get_team_args(data):
    return [data.get('team_code'),
            data.get('team_name'),
            data.get('hometown'),
            data.get('mascot'),
            data.get('university')]
