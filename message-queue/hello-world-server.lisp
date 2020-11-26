;;;; Hello World server example copied from https://github.com/orivej/pzmq/blob/master/examples.lisp 
;;;; (corresponds to the educational requester and responder example at http://zguide.zeromq.org

(require :pzmq)

(defun hwserver (&optional (listen-address "tcp://*:5555"))
  "Translation of http://zguide.zeromq.org/c:hwserver updated for ZMQ 3. "
  (pzmq:with-context nil ; use *default-context*
    (pzmq:with-socket responder :rep
      (pzmq:bind responder listen-address)
      (loop
        (write-string "Waiting for a request... ")
        (write-line (pzmq:recv-string responder))
        (sleep 1)
        (pzmq:send responder "World")))))

(hwserver)
