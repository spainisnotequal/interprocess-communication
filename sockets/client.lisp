(require :usocket)

(defparameter *port* 54321)

(let ((socket (usocket:socket-connect "localhost" *port*)))
  (let ((stream (usocket:socket-stream socket)))

    ;; Send a message to the server
    (format stream "Hello from the client!~%")
    (finish-output stream)

    ;; Receive a message to the server
    (format t "Data received: ~a~%" (read-line stream))

    ;; Close socket
    (usocket:socket-close socket)))
