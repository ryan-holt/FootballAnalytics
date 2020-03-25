import MySQLdb
from flask import request
from flask_restplus import Resource, fields, marshal

from restplus import api, db

ns = api.namespace('admins', description='Operations related to admins')
admin = api.model('Admin',
                  {'username': fields.String(description='Username of admin', required=True, max_length=20),
                   'password': fields.String(description='Password of admin', required=True, max_length=20),
                   'permission_level': fields.Integer(description='Permission level given to admin', required=True)})


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

        Use Case: An admin wants to see a list of all admins for the football analytics website.
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

        Creates a new admin record from a provided username and password. A failure message will be sent to the client
        if the provided username is already taken.
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

        Return's an admin's details by username.
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getAdminByUsername", [username])
            results = cursor.fetchall()
        if not results:
            return {'message': 'No admin exists with the username: {}'.format(username)}, 404
        return marshal(results, admin), 200

    @ns.expect(admin, validate=True)
    @ns.response(code=200, description='Admin updated')
    @ns.response(code=404, description='Admin not found')
    @ns.response(code=500, description='Internal Server Error')
    def put(self, permission_level):
        """
        Update an existing admin's permission level by username.

        Modifies a admin's permission level. An failure message will be send to the client if no admin exists with the
        provided details.
        """
        new_permission_level = permission_level
        connection = db.engine.raw_connection()
        try:
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("updateAdminPermissionLevel", get_admin_args(request.json) + [new_permission_level])
                results = cursor.fetchall()
            if not results[0]['ROW_COUNT()']:
                return {'message': 'No admin exists with the criteria: {}'.format(request.json)}, 404
            connection.commit()
        except Exception as e:
            return {"message": str(e)}, 500
        finally:

            connection.close()
        return {'message': 'admin username has been updated successfully.'}, 200


def get_admin_args(data):
    return [data.get('username'),
            data.get('password'),
            data.get('permission_level')]
