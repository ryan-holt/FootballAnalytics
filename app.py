from flask import Flask, Blueprint

from config import Config
from resources.admin import ns as admin_ns
from resources.client import ns as client_ns
from resources.coaching_staff import ns as coaching_staff_ns
from resources.game import ns as game_ns
from resources.issue import ns as issue_ns
from resources.play import ns as play_ns
from resources.player import ns as player_ns
from resources.team import ns as team_ns
from restplus import db, api

app = Flask(__name__)


def initialize_app(app):
    app.config.from_object(Config)
    blueprint = Blueprint('api', __name__, url_prefix='/api')
    api.init_app(blueprint)

    api.add_namespace(admin_ns)
    api.add_namespace(client_ns)
    api.add_namespace(coaching_staff_ns)
    api.add_namespace(game_ns)
    api.add_namespace(issue_ns)
    api.add_namespace(play_ns)
    api.add_namespace(player_ns)
    api.add_namespace(team_ns)

    app.register_blueprint(blueprint)
    db.init_app(app)


if __name__ == '__main__':
    initialize_app(app)
    app.run()
