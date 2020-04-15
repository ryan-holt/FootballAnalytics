import MySQLdb
from flask import request
from flask_restplus import Resource, marshal

from models.admin import admin, admin_permission_level_parser
from restplus import api, db

ns = api.namespace('admins', description='Operations related to admins')

@ns.route('/')
class AdminList(Resource):
    """
    Manipulations with admins.
    """

    @ns.marshal_list_with(admin)
    @ns.response(code=200, description='Success')
    def get(self):
        """
        Gets all admins

        Use Case: An admin can use this endpoint to view all admins of the football analytics system.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getAdmins")
            results = cursor.fetchall()
        return results, 200

    @ns.expect(admin, validate=True)
    @ns.response(code=201, description='Admin created')
    @ns.response(code=400, description='Admin already exists')
    @ns.response(code=500, description='Internal Server Error')
    def post(self):
        """
        Adds a new admin

        Use Case: An admin can use this endpoint to create a new admin record from a provided username and
        password. A failure message will be sent to the admin if the provided username is already taken.
        """
        connection = db.engine.raw_connection()
        try:
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("addAdmin", get_admin_args(request.json) + [''])
                # Get out parameter
                cursor.execute('SELECT @_addAdmin_3')
                fail_msg = cursor.fetchall()[0]['@_addAdmin_3']
            if fail_msg:
                return {'message': '{}'.format(fail_msg)}, 400
            connection.commit()
            return {'message': 'admin has been created successfully.'}, 201
        except Exception as e:
            return {"message": str(e)}, 500
        finally:
            connection.close()


@ns.route('/<string:username>', doc={'params': {'username': 'An admin username'}})
class Admin(Resource):
    """
    Manipulations with a specific admin.
    """

    @ns.response(code=200, model=admin, description='Success')
    @ns.response(code=404, description='Admin not found')
    def get(self, username):
        """
        Gets admin by username

        Use case: An admin can use this endpoint to view the details of a specific admin by
        providing a username of the admin. A failure message is sent to the admin if the username
        provided does not exist.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getAdminByUsername", [username])
            results = cursor.fetchall()
        if not results:
            return {'message': 'No admin exists with the username: {}'.format(username)}, 404
        return marshal(results, admin), 200

    @ns.expect(admin_permission_level_parser, validate=True)
    @ns.response(code=200, description='Admin updated')
    @ns.response(code=400, description='Bad Request')
    @ns.response(code=404, description='Admin not found')
    @ns.response(code=500, description='Internal Server Error')
    def put(self, username):
        """
        Update an existing admin's permission level by username.

        Use case: An admin can use this endpoint to modify an existing admin's permission level
        by providing an admin's username. A failure message will be send to the client if no admin exists with the
        provided username.
        """
        data = admin_permission_level_parser.parse_args()
        connection = db.engine.raw_connection()
        try:
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("updateAdminPermissionLevel", [username, data['new_permission_level']])
                results = cursor.fetchall()
            if not results[0]['ROW_COUNT()']:
                return {'message': 'No admin exists with the criteria: {}'.format(data)}, 404
            connection.commit()
        except Exception as e:
            return {"message": str(e)}, 500
        finally:

            connection.close()
        return {'message': "admin's permission level has been updated successfully."}, 200


def get_admin_args(data):
    return [data.get('username'),
            data.get('password'),
            data.get('permission_level')]
