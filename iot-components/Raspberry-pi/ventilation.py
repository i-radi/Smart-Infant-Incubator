import time
import threading
import RPi.GPIO as GPIO
from w1thermsensor import W1ThermSensor

GPIO.setmode(GPIO.BCM)
GPIO.setwarnings(False)

HEATER = 17
Fan = 19

sensor = W1ThermSensor()

GPIO.setup(HEATER,GPIO.OUT)
GPIO.setup(Fan,GPIO.OUT)
class Ventilation:
    def Temp(self):
        temperature = sensor.get_temperature()
        return temperature

    def Heater(self,temp):
        tem=self.Temp()
        if int(tem) <= temp-1 :
            GPIO.output(HEATER, 1)
            print("Heater is ON")
            time.sleep(0.5)
        else :
            GPIO.output(HEATER, 0)
            print("Heater is OFF")
            time.sleep(0.5)

    def Fan(self,temp):
        tem=self.Temp()
        if int(tem) > temp+1 :
            GPIO.output(Fan, 1)
            print("Fan is ON")
            time.sleep(0.5)
        else :
            GPIO.output(Fan, 0)
            print("Fan is OFF")
            time.sleep(0.5)
            
def ventilation(temp):
    print('----------')
    test = Ventilation()
    t1 = threading.Thread (target = test.Temp)
    t2 = threading.Thread (target = test.Heater,args=(temp,))
    t3 = threading.Thread (target = test.Fan,args=(temp,))

    t1.start()
    t2.start()
    t3.start()
    t1.join()
    t2.join()
    t3.join()
        
#ventilation(20)

