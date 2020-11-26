import zmq
import random


def random_integer(n):
    """Returns a random integer between 0 and n."""
    return random.randint(0, n)


def parse_number(s):
    try:
        return int(s)
    except ValueError:
        return float(s)


def random_integer_server(listen_address="tcp://*:5555"):
    context = zmq.Context()
    socket = context.socket(zmq.REP)
    socket.bind(listen_address)

    while True:
        #  Wait for next request from client
        message = socket.recv().decode()
        # convert the string to a number to process de data
        n = parse_number(message)
        print("Received number:", n)

        # get a random integer
        result = random_integer(n)

        # convert the number to a string to send it to the client
        response = str(result)

        # send reply back to client
        socket.send(response.encode())


random_integer_server()
