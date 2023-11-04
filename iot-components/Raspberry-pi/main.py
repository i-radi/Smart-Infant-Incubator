import rabbitMQ
import threading
from uvLamp import *
from weight import *
from heartbeat import *
import RPi.GPIO as GPIO
from tempHumidity import *

GPIO.setup(13,GPIO.OUT)
GPIO.setup(27,GPIO.OUT)
GPIO.setup(19,GPIO.OUT)
GPIO.setup(17,GPIO.OUT)
GPIO.output(13, 1)
GPIO.output(27, 1)
GPIO.output(19, 1)
GPIO.output(17, 1)

consumeControls = threading.Thread(target=rabbitMQ.consumer.consume).start()

temp_humiditySensors = threading.Thread(target= temp_humidity).start()
heart_rateSensor = threading.Thread(target= heart_rate,args=()).start()
weightSensor = threading.Thread(target= weight,args=()).start()