(require :usocket)

(defparameter *port* 54321)

(let ((socket (usocket:socket-connect "localhost" *port*)))
  (format t "Client connected to server... (socket: ~a)~%" socket)
  (let ((stream (usocket:socket-stream socket)))

    ;; Receive a message to the server
    (format t "Message received from server: ~a~%" (read-line stream))

    ;; Close socket
    (usocket:socket-close socket)))
