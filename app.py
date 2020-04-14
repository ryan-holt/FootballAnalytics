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

namespaces = [admin_ns, client_ns, coaching_staff_ns, game_ns,
              issue_ns, play_ns, player_ns, team_ns]


def create_app():
    app = Flask(__name__)
    app.config.from_object(Config)
    blueprint = Blueprint('api', __name__, url_prefix='/api')
    api.init_app(blueprint)

    for namespace in namespaces:
        api.add_namespace(namespace)

    app.register_blueprint(blueprint)
    db.init_app(app)

    return app


if __name__ == '__main__':
    app = create_app()
    app.run()
