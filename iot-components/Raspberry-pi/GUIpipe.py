import struct
import queue
import threading
import time


class PipeHelper:
    pipe_send_name: str = "PythonToCS"
    pipe_receive_name: str = "CSToPython"
    decoding_type = 'ascii'

    def __init__(self, receive_func=None, send_func=None):
        self.send_func = send_func
        self.receive_func = receive_func
        self.send_pipe = open(fr'\\.\pipe\{PipeHelper.pipe_send_name}', 'r+b', 0)
        self.receive_pipe = open(fr'\\.\pipe\{PipeHelper.pipe_receive_name}', 'r+b', 0)
        self.__queue = queue.Queue()
        self.send_thread_handler = threading.Thread(target=self.send_thread)
        self.receive_thread_handler = threading.Thread(target=self.receive_thread)

    def run(self):
        self.send_thread_handler.start()
        self.receive_thread_handler.start()

    def send_message(self, msg: str):
        self.__queue.put(msg)

    def send_thread(self):
        while True:
            try:
                item = self.__queue.get()
                self.__write_message(item)
            except:
                print("send_thread is out")
                return

    def receive_thread(self):
        while True:
            try:
                self.__read_message()
            except:
                print("receive_thread is out")
                return

    def __read_message(self):
        n = struct.unpack('I', self.receive_pipe.read(4))[0]  # Read str length
        s = self.receive_pipe.read(n).decode(PipeHelper.decoding_type)  # Read str
        self.receive_pipe.seek(0)  # Important!!!
        if self.receive_func is not None:
            self.receive_func(s)

    def __write_message(self, msg: str):
        s = msg.encode(PipeHelper.decoding_type)
        self.send_pipe.write(struct.pack('I', len(s)) + s)  # Write str length and str , used to create the struct format
        self.send_pipe.seek(0)  # EDIT: This is also necessary , seek() function is used to change the position of the File Handle to a given specific position. File handle is like a cursor, which defines from where the data has to be read or written in the file.
        if self.send_func is not None:
            self.send_func(s)


server = PipeHelper(receive_func=lambda a: print(a))
server.run()
while True:
    server.send_message("koko")
    time.sleep(2)
