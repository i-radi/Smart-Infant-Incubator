import sys
import time
import math
import influxDB
import RPi.GPIO as GPIO
from helpers import HX711

def cleanAndExit():
    print("Cleaning...")
    GPIO.cleanup()
        
    print("Bye!")
    sys.exit()
    
GPIO.setwarnings(False)
hx = HX711(5, 6)

def setup():

    hx.set_reading_format("MSB", "MSB")

    hx.set_reference_unit(113)

    hx.reset()

    hx.tare()

    #print("Add weight now...")
    
def weight():
    setup()
    while True:
        try:
            val = int(hx.get_weight(5))
            influxDB.write('wieght', math.floor(val) if (val>0) else 0)
            yield(val if (val>0) else 0)
            time.sleep(1)

        except (KeyboardInterrupt, SystemExit):
            cleanAndExit()
            
def single_weight():
    setup()
    try:
        val = int(hx.get_weight(5))
        return(val if (val>0) else 0)

    except (KeyboardInterrupt, SystemExit):
        cleanAndExit()
        
#print(single_weight())

#for value in weight(): 
    #print(value)