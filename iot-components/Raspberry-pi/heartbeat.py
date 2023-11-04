import time
import math
import influxDB
from helpers import Pulsesensor


def heart_rate():
    p = Pulsesensor()
    p.startAsyncBPM()
    try:
        while True:
            bpm = p.BPM
            if bpm > 0:
                influxDB.write('heartBeat', math.floor(bpm))
                yield math.floor(bpm)
            else:
                influxDB.write('heartBeat', 0)
                yield 0
            time.sleep(1)
    except:
        p.stopAsyncBPM()

#for value in heart_rate(): 
 #   print(value)