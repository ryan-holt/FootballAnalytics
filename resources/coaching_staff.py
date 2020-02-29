import MySQLdb
from flask import request, jsonify, make_response
from flask_restplus import Resource, fields

from restplus import api, db

ns = api.namespace('coaching_staff', description='Operations related to coaching staff')
coaching_staff = api.model('Coaching_staff',
                           {'team_code': fields.String(description='Team code of team', required=True, max_length=3),
                            'first name': fields.String(description='Name of team', required=True, max_length=45),
                            'last name': fields.String(description='Hometown of team,', required=True, max_length=45),
                            'position': fields.String(description="Mascot of team", required=True, max_length=100)
                            })


@ns.route('/<string:team_code>')
class CoachingStaffList(Resource):
    def get(self, team_code):
        """Gets all coaching staff for a team"""
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getCoachingStaffByTeam", [team_code])
            results = cursor.fetchall()
            if not results:
                return make_response({'message': 'The team code {} does not exist.'.format(team_code)}, 404)
        return make_response(jsonify(results), 200)


@ns.route('/<int:coaching_staff_id>')
class CoachingStaff(Resource):
    def get(self, coaching_staff_id):
        """Gets a coaching staff member by id"""
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getCoachingStaffById", [coaching_staff_id])
            results = cursor.fetchall()
            if not results:
                return make_response(
                    {'message': 'No coaching staff member exists with id: {}'.format(coaching_staff_id)}, 404)
        return make_response(jsonify(results), 200)


@ns.route('/')
class AddCoachingStaff(Resource):
    @ns.expect(coaching_staff, validate=True)
    def post(self):
        """Adds a new coaching staff member to a team"""
        data = request.json
        connection = db.engine.raw_connection()
        try:
            args = get_coaching_staff_args(data)
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("addCoachingStaffByTeam", args)
                results = cursor.fetchall()
                cursor.close()
                connection.commit()
                if not results:
                    return make_response({'message': 'The team code {} does not exist.'.format(args[0])}, 404)
        except Exception as e:
            return make_response({"message": str(e)}, 500)
        finally:
            connection.close()
        return make_response({'message': 'team has been created successfully.'}, 201)


def get_coaching_staff_args(data):
    return [data.get('team_code'),
            data.get('first_name'),
            data.get('last_name'),
            data.get('position')]
