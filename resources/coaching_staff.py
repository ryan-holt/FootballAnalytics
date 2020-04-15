import MySQLdb
from flask import request
from flask_restplus import Resource, marshal

from models.coaching_staff import coaching_staff
from restplus import api, db

ns = api.namespace('coaching_staff', description='Operations related to coaching staff')


@ns.route('/')
class CoachingStaffList(Resource):
    """
    Manipulations with coaching staff.
    """

    @ns.response(code=201, description='Coaching staff created')
    @ns.response(code=404, description='Team code not found')
    @ns.response(code=500, description='Internal Server Error')
    @ns.expect(coaching_staff, validate=True)
    def post(self):
        """
        Adds a new coaching staff member to a team

        Use Case: This endpoint is used by an admin to create a new coaching staff member
        record for their team by providing a team code. A failure message is returned if
        the provided team code does not exist.
        """
        data = request.json
        connection = db.engine.raw_connection()
        try:
            args = get_coaching_staff_args(data)
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("addCoachingStaffByTeam", args + [''])
                # Get out parameter
                cursor.execute('SELECT @_addCoachingStaffByTeam_4')
                fail_msg = cursor.fetchall()[0]['@_addCoachingStaffByTeam_4']
                if fail_msg:
                    return {'message': '{}'.format(fail_msg)}, 400
            connection.commit()
        except Exception as e:
            return {"message": str(e)}, 500
        finally:
            connection.close()
        return {'message': 'coaching staff has been created successfully.'}, 201


@ns.route('/<string:team_code>', doc={'params': {'team_code': 'The team code of coaching staff'}})
class CoachingStaffTeamList(Resource):
    """
    Manipulations with a team's coaching staff.
    """

    @ns.response(code=200, model=coaching_staff, description='Success')
    @ns.response(code=404, description='Coaching staff not found')
    def get(self, team_code):
        """
        Gets all coaching staff for a team

        Use case: This endpoint is used by a client to see who is part of the coaching staff for a specific team
        by providing a team code. A message is returned to the client if the team does not have coaching staff.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getCoachingStaffByTeam", [team_code])
            results = cursor.fetchall()
            if not results:
                return {'message': 'Coaching staff not found for team code: {}.'.format(team_code)}, 404
        return marshal(results, coaching_staff), 200


@ns.route('/<int:coaching_staff_id>',  doc={'params': {'coaching_staff_id': 'A coaching staff member\'s ID'}})
class CoachingStaff(Resource):
    """
    Manipulations with a specific coaching staff member.
    """

    @ns.response(code=200, model=coaching_staff, description='Success')
    @ns.response(code=404, description='Coaching staff member not found')
    def get(self, coaching_staff_id):
        """
        Gets a coaching staff member by ID

        Use Case: This endpoint can be used by a client to view the details of a specific coaching staff member
        by providing their coaching staff id. A message is sent to the client if the coaching staff id does not exist.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getCoachingStaffById", [coaching_staff_id])
            results = cursor.fetchall()
            if not results:
                return {'message': 'No coaching staff member exists with id: {}'.format(coaching_staff_id)}, 404
        return marshal(results, coaching_staff), 200


def get_coaching_staff_args(data):
    return [data.get('team_code'),
            data.get('first_name'),
            data.get('last_name'),
            data.get('position')]
