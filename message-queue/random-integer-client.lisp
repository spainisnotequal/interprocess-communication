(require :pzmq)

(defun random-integer-client (&optional (server-address "tcp://localhost:5555"))
  (pzmq:with-context (context :max-sockets 10)
    (pzmq:with-socket (requester context) (:req :affinity 3 :linger 100)
      ;; linger is important in case of (keyboard) interrupt;
      ;; see http://api.zeromq.org/3-3:zmq-ctx-destroy
      (write-line "Connecting to add1 server...")
      (pzmq:connect requester server-address)

      (dotimes (i 10)
        (let ((upper-limit 100))
          (format t "Sending ~d... " upper-limit)
          ;;(pzmq:send requester "1")
          (pzmq:send requester (write-to-string upper-limit))
          (write-string "Receiving... ")
          (write-line (pzmq:recv-string requester)))))))

(random-integer-client)
