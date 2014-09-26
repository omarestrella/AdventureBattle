import gevent
import flask
import json
import authentication
from flask.ext.socketio import SocketIO, emit

app = flask.Flask(__name__)
app.secret_key = 'keep it secret, keep it safe'
socketio = SocketIO(app)


@app.route("/")
def hello():
    return flask.render_template('index.html')

@app.route("/session", methods=['GET'])
def check_session():
    if 'username' not in flask.session:
        return flask.make_response(('Unauthorized', 401))
    else:
        return flask.make_response((
            json.dumps({
                'username': flask.session['username']
            }),
            201
        ))

@app.route("/login", methods=['POST'])
def login():
    username = flask.request.form['username']
    password = flask.request.form['password']

    if authentication.verify_user_password(username, password):
        flask.session['username'] = username
        return flask.make_response(('success', 200))
    else:
        return flask.make_response(('unauthorized', 401))

@app.route("/register", methods=['POST'])
def register():
    username = flask.request.form['username']
    password = flask.request.form['password']

    if authentication.create_user(username, password):
        flask.session['username'] = username
        return flask.make_response(('success', 201))
    else:
        return flask.make_response(('unauthorized', 401))

@socketio.on('connect', namespace='/test')
def test_connect():
    emit('my response', {'data': 'Connected'})

@socketio.on('disconnect', namespace='/test')
def test_disconnect():
    print('Client disconnected')


if __name__ == "__main__":
    authentication.setup_users_table()
    socketio.run(app)
