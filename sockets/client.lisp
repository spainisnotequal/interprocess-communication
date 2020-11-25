(require :usocket)

(defparameter *port* 54321)

(defun run-client (port)
  (usocket:with-client-socket (socket stream "localhost" port)
    ;; Send a message to the server
    (let ((number 1.5))
      (format stream "~d" number)
      (finish-output stream))

    ;; Receive a message to the server
    (format t "Data received: ~a~%" (read-line stream))))

(run-client *port*)
