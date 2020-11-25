(require :usocket)

(defparameter *port* 54321)

(let ((socket (usocket:socket-listen "localhost" *port*)))
  (format t "Server listening...~%")
  (let* ((connection (usocket:socket-accept socket))
         (stream (usocket:socket-stream connection)))

    ;; Receive a message to the client
    (format t "Data received: ~a~%" (read-line stream))

    ;; Send a message to the client
    (format stream "Bye from the server!~%")
    (finish-output stream)

    ;; Close both connection and socket
    (usocket:socket-close connection)
    (usocket:socket-close socket)))
