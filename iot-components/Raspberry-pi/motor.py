#from GPIOEmulator.EmulatorGUI import GPIO
import time
import RPi.GPIO as GPIO

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

MOTOR = 13

def turn_motor(action):
    GPIO.setup(MOTOR,GPIO.OUT)

    def MotorLow():
        GPIO.output(MOTOR, 1)
        print("Lowering Incubator")
        time.sleep(0.5)

    def MotorHigh():
        GPIO.output(MOTOR, 0)
        print("Raising Incubator")
        time.sleep(0.5)

    if action == 'DOWN':
        MotorLow()
    elif action == 'UP':
        MotorHigh()
    else:
        print('Invalid Parameter')

#turn_motor('UP')