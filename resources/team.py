import MySQLdb
from flask import request
from flask_restplus import Resource, fields, marshal

from restplus import api, db

ns = api.namespace('teams', description='Operations related to teams')
team = api.model('Team',
                 {'team_code': fields.String(description='Team code of team', required=True, max_length=3),
                  'team_name': fields.String(description='Name of team', required=True, max_length=45),
                  'hometown': fields.String(description='Hometown of team,', required=True, max_length=45),
                  'mascot': fields.String(description="Mascot of team", required=True, max_length=45),
                  'university': fields.String(description='University of team', required=True, max_length=45)
                  })


@ns.route('/')
class TeamList(Resource):
    """
    Manipulations with teams.
    """

    @ns.marshal_list_with(team)
    def get(self):
        """
        Gets all teams

        Use Case: This endpoint can be used by a client to see a list of all teams in the league.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getTeams")
            results = cursor.fetchall()
        return results, 200

    @ns.expect(team, validate=True)
    @ns.response(code=400, description='Team code already exists')
    @ns.response(code=500, description='Internal Server Error')
    def post(self):
        """
        Adds a new team

        Use Case: This endpoint can be used by an admin to create a new team record. The endpoint checks if a team
        with the provided team code already already exists. If so, a failure message will be sent to
        the admin indicating that the team already exists.
        """
        data = request.json
        connection = db.engine.raw_connection()
        try:
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("addTeam", get_team_args(data) + [''])
                # Get out parameter
                cursor.execute('SELECT @_addTeam_5')
                fail_msg = cursor.fetchall()[0]['@_addTeam_5']
                if fail_msg:
                    return {'message': '{}'.format(fail_msg)}, 400
            connection.commit()
        except Exception as e:
            return {"message": str(e)}, 500
        finally:
            connection.close()
        return {'message': 'team has been created successfully.'}, 201


@ns.route('/<string:team_code>', doc={'params': {'team_code': 'A team code'}})
class Team(Resource):
    """
    Manipulations with a specific team.
    """

    @ns.response(code=200, model=team, description='Success')
    @ns.response(code=404, description='Team not found')
    def get(self, team_code):
        """
        Gets a team by team code

        Use Case: This endpoint can be used by a client to view a team's details by providing a team code. A message is
        returned to the client if the provided team code does not exist.
        """

        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getTeamByTeamCode", [team_code])
            results = cursor.fetchall()
        if not results:
            return {'message': 'No team exists with the team code: {}'.format(team_code)}, 404
        return marshal(results, team), 200


def get_team_args(data):
    return [data.get('team_code'),
            data.get('team_name'),
            data.get('hometown'),
            data.get('mascot'),
            data.get('university')]
