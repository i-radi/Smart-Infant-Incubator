from http import client
from pydoc import cli
import struct
import queue
import threading
import time
from typing import List
from pydantic import BaseModel
import json

class PipeServer:
    pipe_send_name: str = "PythonToCS"
    def __init__(self, when_send_message = None) -> None:
        self.pipe = open(fr'\\.\pipe\{PipeServer.pipe_send_name}', 'r+b', 0)
        self.__proxy = PipeProxy(self.pipe,False, when_send_message)
        print("server connected")
    
    def run(self):
        self.__proxy.run()

    def send_message(self, msg: str):
        self.__proxy.send_message(msg)


class PipeClient:
    pipe_receive_name: str = "CSToPython"
    def __init__(self, when_recieve_message) -> None:
        self.pipe = open(fr'\\.\pipe\{PipeClient.pipe_receive_name}', 'r+b', 0)
        self.__proxy = PipeProxy(self.pipe,True, when_recieve_message)
        print("client connected")

    def run(self):
        self.__proxy.run()

class SensorData(BaseModel):
    temperatur: int
    isOn: bool
    name: str
    values: List[int]
    
    class Config:
        allow_mutation = True

class PipeProxy:
    decoding_type = 'ascii'
    def __init__(self,stream, is_reader : bool, agregator=None):
        self.stream = stream
        self.agregator = agregator
       
        if is_reader:
            self.__thread_handler = threading.Thread(target=self.receive_thread)
        else:
            self.__queue = queue.Queue()
            self.__thread_handler = threading.Thread(target=self.send_thread)

    # Thread Managment
    def run(self):
        self.__thread_handler.start()

    def send_thread(self):
        while True:
            try:
                item = self.__queue.get()
                self.__write_message(item)
            except Exception as e:
                print("send_thread is out",e)
                return

    def receive_thread(self):
        while True:
            try:
                self.__read_message()
            except Exception as e:
                print("receive_thread is out",e)
                return


    # Message Managment
    def send_message(self, msg: str):
        self.__queue.put(msg)

    def __read_message(self):
        n = struct.unpack('I', self.stream.read(4))[0]  # Read str length
        s = self.stream.read(n).decode(PipeProxy.decoding_type)  # Read str
        self.stream.seek(0)  # Important!!!
        if self.agregator is not None:
            self.agregator(s)

    def __write_message(self, msg: str):
        s = msg.encode(PipeProxy.decoding_type)
        self.stream.write(struct.pack('I', len(s)) + s)  # Write str length and str
        self.stream.seek(0)  # EDIT: This is also necessary
        if self.agregator is not None:
            self.agregator(s)


data = SensorData(temperatur= 40.3, isOn= False, name= "Hamada",values= [2,5,3,4])
def deserialize(msg: str):
    val = SensorData(**json.loads(msg))
    print(val.values)


client = PipeClient(when_recieve_message= deserialize)
client.run()
server = PipeServer()
server.run()



while True:
    server.send_message(data.json())
    time.sleep(5)
