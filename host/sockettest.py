import socket
from key_process import *

def initiate():
	HOST = '10.42.0.1'                # Symbolic name meaning all available interfaces
	PORT = 5008              # Arbitrary non-privileged port
	s = socket.socket(socket.AF_INET, socket.SOCK_STREAM)
	s.setsockopt(socket.SOL_SOCKET, socket.SO_REUSEADDR, 1)
	s.bind((HOST, PORT))
	s.listen(1)
	while True:
		pass
		conn, addr = s.accept()
		print ('Connected by', addr)
		while 1:
			data = conn.recv(1024)
			datab = data.decode('utf-8')
			#print(len(datab),'.........')
			if datab == '\n':
				continue
			print(datab)
			data_list = datab.split()
			x = data_list[0]
			y = data_list[1]
			move_mouse(x,y)

if __name__ == '__main__':
	try:
		main_cycle()
	except KeyboardInterrupt:
		s.close()
