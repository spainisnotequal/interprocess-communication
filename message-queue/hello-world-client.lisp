;;;; Hello World client example copied from https://github.com/orivej/pzmq/blob/master/examples.lisp 
;;;; (corresponds to the educational requester and responder example at http://zguide.zeromq.org

(require :pzmq)

(defun hwclient (&optional (server-address "tcp://localhost:5555"))
  "Translation of http://zguide.zeromq.org/c:hwclient updated for ZMQ 3.  Includes some parameters in with-* macros to demonstrate syntax."
  (pzmq:with-context (context :max-sockets 10)
    (pzmq:with-socket (requester context) (:req :affinity 3 :linger 100)
      ;; linger is important in case of (keyboard) interrupt;
      ;; see http://api.zeromq.org/3-3:zmq-ctx-destroy
      (write-line "Connecting to hello world server...")
      (pzmq:connect requester server-address)
      (dotimes (i 10)
        (format t "Sending Hello ~d...~%" i)
        (pzmq:send requester "Hello")
        (write-string "Receiving... ")
        (write-line (pzmq:recv-string requester))))))

(hwclient)
