from time import sleep
import pyautogui

# will decide later what speed might here be
SPEED_MOUSE_MOVEMENT = -5
pyautogui.MINIMUM_DURATION = 0
pyautogui.FAILSAFE = False

def press( keys: list ):
    if type(keys[0]) == str:
        pyautogui.press(keys)
    else:
        for combination in keys:
            sleep(2)
            if len(combination) > 1:
                pyautogui.hotkey(*combination)
            else:
                pyautogui.press(combination)

def click(tip: int):
    if tip == 1:
        pyautogui.click(button='right', _pause=False)
    elif tip == 0:
        pyautogui.click(_pause=False)

def write(text: str):
    pyautogui.write(text);

def move_mouse(dx: float, dy: float):
    dx *= SPEED_MOUSE_MOVEMENT
    dy *= SPEED_MOUSE_MOVEMENT
    pyautogui.move(dx, dy, _pause = False) #_pause= True


# def move_mouse2(dx: float, dy:float):
#     x,y = pyautogui.position()
#     pyautogui.moveTo(x + dx , y + dy)