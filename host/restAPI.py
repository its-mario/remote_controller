from werkzeug.serving import make_server
from threading import Thread
from flask import Flask
from flask import request
import key_processing


app = Flask(__name__)


@app.route("/")
def hello_world():
    return "Connection Estabilished"

@app.route('/click/<int:tip>', methods=["POST"])
def click(tip: int):
    key_processing.click(tip)
    print(str(type(tip) == int))
    return "Succes"

@app.route('/keys', methods=["POST"])
def press():
    req = request.get_json()
    key_processing.press(req["keys"])
    return "Succes"

@app.route('/write', methods=["POST"])
def write():
    req = request.get_json()
    key_processing.write(req["text"])
    return "Succes"


class RestThread(Thread):

    def __init__(self, app):
        Thread.__init__(self)
        self.srv = make_server('0.0.0.0', 5005, app)
        self.ctx = app.app_context()
        self.ctx.push()
    
    def run(self):
        # log.info('starting server')
        print("Server is running")
        self.srv.serve_forever()
    
    def shutdown(self):
        self.srv.shutdown()

def start_server():
    global server
    server = RestThread(app)
    server.start()
    print('server started')

def stop_server():
    global server
    server.shutdown()

if __name__ == "__main__":
    app.run(host = '0.0.0.0', port= 5005)