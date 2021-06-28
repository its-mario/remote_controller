
from udp_stream import UDPHost
import key_processing
import restAPI
import json
	

def proccesing_movement(msg:str):
    di = json.loads(msg)
    print("x:{} ,y:{}".format(di['dx'],di['dy']))
    key_processing.move_mouse(**di)


if __name__ == '__main__':
    try:
        udpHost = UDPHost("0.0.0.0", 20001, proccesing_movement)
        udpHost.start()
        # app.run(host = "0.0.0.0", port = 5001, debug= False)
        restAPI.start_server()
    except KeyboardInterrupt:
        print("shutting down ...")
        udpHost.exit = True
        udpHost.join()
        restAPI.stop_server()