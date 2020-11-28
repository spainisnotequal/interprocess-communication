import zmq
import json


def json_server(listen_address="tcp://*:5555"):
    context = zmq.Context()
    socket = context.socket(zmq.REP)
    socket.bind(listen_address)

    while True:
        #  Wait for next request from client
        message = socket.recv().decode()
        # convert the JSON to a Python object
        py_object = json.loads(message)
        print("Received object:", py_object)

        # do some stuff with the Python object
        # (in this example, just return the Python object without doing anything with it)

        # convert the Python object to JSON
        response = json.dumps(py_object)

        # send reply back to client
        socket.send(response.encode())


if __name__ == "__main__":
    json_server()
