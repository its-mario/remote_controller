import socket
import json
import key_processing

# localIP     = "127.0.0.1"

# localPort   = 20001

# bufferSize  = 1024

 

# msgFromServer       = "Hello UDP Client"

# bytesToSend         = str.encode(msgFromServer)

 

# # Create a datagram socket

# UDPServerSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)

 

# # Bind to address and ip

# UDPServerSocket.bind((localIP, localPort))

 

# print("UDP server up and listening")

 

# # Listen for incoming datagrams

# while(True):

#     bytesAddressPair = UDPServerSocket.recvfrom(bufferSize)

#     message = bytesAddressPair[0]

#     address = bytesAddressPair[1]

#     print(message.decode())

   

    # Sending a reply to client

BUFFERSIZE = 1024

class UDPHost():
    
    def __init__(self, ipHost: str, port: int, callback):
        self.udpSocket = socket.socket(family=socket.AF_INET, type=socket.SOCK_DGRAM)
        self.udpSocket.bind((ipHost, port))
        print('Server is listening')
        while(True):
            bytesAddressPair = self.udpSocket.recvfrom(BUFFERSIZE)
            message = bytesAddressPair[0]
            #address = bytesAddressPair[1]
            print(message.decode())
            if self.check(msg= message.decode()):
                callback(message.decode())
    

    def check(self,msg:str):
        try:
            di = json.loads(msg)
            if isinstance(di['dx'], (int, float, complex)) and isinstance(di['dy'], (int, float, complex)):
                return True
        except:
            print("Wrong format")
        

def callB(som):
    print("--->"+ som)
    di = json.loads(som)
    key_processing.move_mouse(**di)


if __name__ == "__main__":
    server = UDPHost("0.0.0.0", 20001, callB)
