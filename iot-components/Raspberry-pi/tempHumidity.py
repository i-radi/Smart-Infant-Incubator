import time
import math
import board
import psutil
import influxDB
import adafruit_dht

def temp_humidity():
    # We first check if a libgpiod process is running. If yes, we kill it!
    for proc in psutil.process_iter():
        if proc.name() == 'libgpiod_pulsein' or proc.name() == 'libgpiod_pulsei':
            proc.kill()

    sensor = adafruit_dht.DHT11(board.D23)

    while True:
        try:
            temp = sensor.temperature
            humidity = sensor.humidity
            influxDB.write('temperature', math.floor(temp)if (temp != None) else 0)
            influxDB.write('humidity', math.floor(humidity)if (humidity != None) else 0)
            yield [temp,humidity]
        except RuntimeError as error:
            #print(error.args[0])
            influxDB.write('temperature', 0)
            influxDB.write('humidity', 0)
            yield [0,0]
            time.sleep(1)
            continue
        except Exception as error:
            sensor.exit()
            raise error

        time.sleep(1)

#for value in temp_humidity(): 
 #   print(value)
def temperature():
    temp = temp_humidity()
    yield temp[0]

def humidity():
    humi = temp_humidity()
    yield humi[1]