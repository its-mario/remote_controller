import threading
from flask import Flask
from flask import request, jsonify
from key_process import *
from sockettest import *

app = Flask(__name__)

@app.route('/press_key/<key>')
def comand_key(key):
	press_key(key)
	return 'Succes'

@app.route('/press_combination/<type>')
def comand_combination(type):
	press_combination(type)
	return 'Succes'

@app.route('/mouseclick/<key>')
def mouseclick(key):
	pyautogui.click(button = key)
	return 'Succes'
	

if __name__ == '__main__':
	threading.Thread(target=initiate).start()
	#threading.Thread(target=app.run, kwargs={'debug':True , 'host': '0.0.0.0','port': 5005}).start()

	app.run(debug = True , host = '0.0.0.0',port = 5005)
