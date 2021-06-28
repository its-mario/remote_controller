import socket
import json
import key_processing
from threading import Thread, ThreadError

BUFFERSIZE = 1024

def defaultCallBack(msg: str):
    print("Callback for: " + msg)

class UDPHost(Thread):

        
    def __init__(self, ipHost: str, port: int, callback = defaultCallBack):
        Thread.__init__(self)
        self.udpSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
        self.udpSocket.bind((ipHost, port))
        self.callback = callback
        self.exit = False
        print('Server is listening')
        
    
    def run(self):
        
        while(not self.exit):
            bytesAddressPair = self.udpSocket.recvfrom(BUFFERSIZE)
            message = bytesAddressPair[0]
            decoded_message = message.decode()
            #address = bytesAddressPair[1]
            if self.check(msg= decoded_message):
                self.callback(decoded_message)
        

    #check if the recived data is right format
    def check(self,msg:str):
        try:
            di = json.loads(msg)
            if isinstance(di['dx'], (int, float, complex)) and isinstance(di['dy'], (int, float, complex)):
                return True
        except:
            print("Wrong format")



if __name__ == "__main__":
    server = UDPHost("0.0.0.0", 20001)
    server.start()
