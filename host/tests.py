import key_processing
from time import sleep

def click_test():
    #right click test
    for i in range (3,0,-1):
        print(i)
        sleep(i)
    key_processing.click(1)
    print("The right click was pressed")

    #left click test

    for i in range (3,0,-1):
        print(i)
        sleep(i)
    key_processing.click(0)
    print("The left click was pressed")

def key_press():
    # single
    lista = ['prntscrn']
    sleep(1)
    print(lista, 'was pressed')
    key_processing.press(lista)
    sleep(2)
    key_processing.press(lista)
    print("super/win button was pressed twice")

    #multiple
    print('Multiple hotkeys')
    lista1 = [['ctrl','alt','del'], ['esc']]
    key_processing.press(lista1)

def move_mouse():
    # for s in range(3,0,-1):
    #     sleep(s)
    #     print(s)
    key_processing.move_mouse(-45,4)


if __name__ == "__main__":
    move_mouse()