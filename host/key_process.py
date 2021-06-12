import pyautogui
pyautogui.FAILSAFE = False

def press_key(key):
	pyautogui.press(key)
	print(key)

def press_combination(type):
	if type == 'close':
		pyautogui.press('space')
		pyautogui.press('esc')
		pyautogui.hotkey('ctrl','alt','d')
	elif type == 'open':
		pyautogui.hotkey('ctrl','alt','d')
		pyautogui.press('f')
		pyautogui.press('space')


def move_mouse(x,y):
	present_pos_x , present_pos_y= pyautogui.position()
	pyautogui.moveRel(-float(x)*15,-float(y)*15)
