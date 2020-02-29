import MySQLdb
from flask import request, jsonify, make_response
from flask_restplus import Resource, fields

from restplus import api, db

ns = api.namespace('admins', description='Operations related to admins')
admin = api.model('Admin',
                  {'username': fields.String(description='Username of admin', required=True, max_length=20),
                   'password': fields.String(description='Password of admin', required=True, max_length=20),
                   'permission_level': fields.Integer(description='Permission level given to admin', required=True)})


@ns.route('/')
class AdminList(Resource):
    def get(self):
        """
        Gets all admins
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getAdmins")
            results = cursor.fetchall()
        return make_response(jsonify(results), 200)

    @ns.expect(admin, validate=True)
    def post(self):
        """
        Adds a new admin
        """
        connection = db.engine.raw_connection()
        try:
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("addAdmin", get_admin_args(request.json))
                connection.commit()
            return make_response({'message': 'client has been created successfully.'}, 201)
        except Exception as e:
            return make_response({"message": str(e)}, 500)
        finally:
            connection.close()


@ns.route('/<string:username>')
class Admin(Resource):
    def get(self, username):
        """
        Gets the specified admin
        """
        with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
            cursor.callproc("getAdminByUsername", [username])
            results = cursor.fetchall()
        if not results:
            return make_response({'message': 'No admin exists with the username: {}'.format(username)}, 404)
        return make_response(jsonify(results), 200)

    @ns.expect(admin, validate=True)
    def put(self, username):
        """
        Updates the username of the specified admin
        """
        new_username = username
        connection = db.engine.raw_connection()
        try:
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("updateAdminUsername", get_admin_args(request.json) + [new_username])
                results = cursor.fetchall()
            if not results[0]['ROW_COUNT()']:
                return make_response({'message': 'No admin exists with the criteria: {}'.format(request.json)}, 404)
            connection.commit()
        except Exception as e:
            return make_response({"message": str(e)}, 500)
        finally:

            connection.close()
        return make_response({'message': 'client username has been updated successfully.'}, 201)



def get_admin_args(data):
    return [data.get('username'),
            data.get('password'),
            data.get('permission_level')]
