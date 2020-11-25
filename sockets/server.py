#!/usr/bin/env python3

import socket

PORT = 54321        # Port to listen on (non-privileged ports are > 1023)

ADDRESS_FAMILY = socket.AF_INET
SOCKET_TYPE = socket.SOCK_STREAM

with socket.socket(ADDRESS_FAMILY, SOCKET_TYPE) as s:
    s.bind(("localhost", PORT))
    s.listen()
    print("Server listening...")
    conn, addr = s.accept()
    with conn:
        print("Connected by:", addr)
        data = conn.recv(1024).decode()
        print("Data received:", data)
        message = "Bye from the server!"
        conn.sendall(message.encode())
