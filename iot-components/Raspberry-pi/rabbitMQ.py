import mic
import json
import pika
import time
import motor
import uvLamp
import helpers
import ventilation as vent

localhost = '192.168.1.8'

connection = pika.BlockingConnection(pika.ConnectionParameters(host=localhost))
channel = connection.channel()

def declareQueues():
            channel.queue_declare(queue='Mic')
declareQueues()

class preducer:
    def publish_Mic(channel,f_size):
      channel.basic_publish(exchange='', routing_key='Mic',
      body=helpers.send_image(f_size))
 
class consumer:                      
    def consume(ch=channel):
        ch.basic_consume('Controls', deserialization.control, auto_ack=True)
        print(' [*] Waiting for messages:')
        ch.start_consuming()

class deserialization:
  def callback(ch, method, properties, body):
      print(" [x] Received %r" % body.decode())
      dic_body = json.loads(body.decode())     #convert json file to dic
      return dic_body
  def control(ch, method, properties, body):  
      dic_body = deserialization.callback(ch, method, properties, body)  
      sensor = dic_body["Sensor"]               #key = {"sensor", "action"} 
      action = dic_body["Action"]               #value = {"1/2/3/4","22.5/on/up"}
                                   
      #Request of user..
      if sensor == 1:                           #Temp which controls fan & heater
        vent.ventilation(float(action))                               
      elif sensor == 2:                         #state of motor...
        motor.turn_motor(action)
      elif sensor == 3:                         #state of uv lamp...
        uvLamp.turn_UVLamp(action)
      elif sensor == 4:                         #open the mic
        mic.start_mic()
        preducer.publish_Mic(channel,(3, 3))
        time.sleep(1)
        preducer.publish_Mic(channel,(4, 4))