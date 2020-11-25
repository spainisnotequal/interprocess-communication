(require :usocket)

(defparameter *port* 54321)

(let ((socket (usocket:socket-listen "localhost" *port*)))
  (format t "Server listening... (socket: ~a)~%" socket)
  (let* ((connection (usocket:socket-accept socket))
         (stream (usocket:socket-stream connection)))

    ;; Send a message to the client
    (format stream "Hello from the server!~%")
    (finish-output stream)

    ;; Print a message in the server
    (format t "Message sent to client.~%")

    ;; Close both connection and socket
    (usocket:socket-close connection)
    (usocket:socket-close socket)))
