#!/usr/bin/env python3

import socket

PORT = 54321        # Port to listen on (non-privileged ports are > 1023)

ADDRESS_FAMILY = socket.AF_INET
SOCKET_TYPE = socket.SOCK_STREAM


def add1(n):
    return n + 1


def parse_number(s):
    try:
        return int(s)
    except ValueError:
        return float(s)


def run_server(port):
    with socket.socket(ADDRESS_FAMILY, SOCKET_TYPE) as s:
        s.bind(("localhost", port))
        s.listen()
        print("Server listening...")
        conn, addr = s.accept()
        with conn:
            print("Connected by:", addr)
            data = conn.recv(1024).decode()
            # convert the string to a number to process de data
            data = parse_number(data)
            print("Data received:", data)
            response = add1(data)
            # convert the number to a string to send it to the client
            response = str(response)
            conn.sendall(response.encode())


run_server(PORT)
