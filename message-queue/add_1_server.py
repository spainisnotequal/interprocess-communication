import zmq


def add1(n):
    return n + 1


def parse_number(s):
    try:
        return int(s)
    except ValueError:
        return float(s)


def add1_server(listen_address="tcp://*:5555"):
    context = zmq.Context()
    socket = context.socket(zmq.REP)
    socket.bind(listen_address)

    while True:
        #  Wait for next request from client
        message = socket.recv().decode()
        # convert the string to a number to process de data
        n = parse_number(message)
        print("Received number:", n)

        # add 1 to the received number
        result = add1(n)

        # convert the number to a string to send it to the client
        response = str(result)

        # send reply back to client
        socket.send(response.encode())


add1_server()
