import MySQLdb
from flask import request, jsonify
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
        return jsonify(results)

    @api.expect(admin, validate=True)
    def post(self):
        """
        Adds a new admin
        """
        data = request.json
        name = data.get('username')
        password = data.get('password')
        permission_level = data.get('permission_level')
        connection = db.engine.raw_connection()
        try:
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("addAdmin", [name, password, permission_level])
                connection.commit()
        finally:
            connection.close()
        return {'message': 'client has been created successfully.'}, 201

@ns.route('/<string:username>')
class Admin(Resource):
    def get(self, username):
        """
        Gets the specified admin
        """
        if username:
            with db.engine.raw_connection().cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("getAdminByUsername", [username])
                results = cursor.fetchall()
            return jsonify(results)

    @api.expect(admin, validate=True)
    def put(self, username):
        """
        Updates the username of the specified admin
        """
        data = request.json
        new_username = data.get('username')
        password = data.get('password')
        permission_level = data.get('permission_level')
        connection = db.engine.raw_connection()
        try:
            with connection.cursor(MySQLdb.cursors.DictCursor) as cursor:
                cursor.callproc("updateAdminUsername", [username, new_username, password, permission_level])
                # TODO find way to see if it actually updated anyting in the query
                connection.commit()
        except:
            return {'message': 'failed to update client username.'}, 201
        finally:
            connection.close()
        return {'message': 'client username has been updated successfully.'}, 201
