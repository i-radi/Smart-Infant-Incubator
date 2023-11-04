import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

UV_Lamp = 27

GPIO.setup(UV_Lamp,GPIO.OUT)

def turn_UVLamp(action):
    if action =='OFF':
        GPIO.output(UV_Lamp, 1)
    elif action == 'ON':
        GPIO.output(UV_Lamp, 0)
    else:
        print('Invalid Parameter')

#turn_UVLamp('ON')
