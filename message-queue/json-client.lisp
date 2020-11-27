(require :pzmq)
(require :jonathan)

(defun json-client (&optional (server-address "tcp://localhost:5555"))
  (pzmq:with-context (context :max-sockets 10)
    (pzmq:with-socket (requester context) (:req :affinity 3 :linger 100)
      ;; linger is important in case of (keyboard) interrupt;
      ;; see http://api.zeromq.org/3-3:zmq-ctx-destroy
      (write-line "Connecting to add1 server...")
      (pzmq:connect requester server-address)

      (let ((plist '(:a 1 :b 2 :c 3)))
        (format t "Sending ~a... " plist)
        (pzmq:send requester (jonathan:to-json plist))
        (format t "Receiving... ~a~%"(jonathan:parse (pzmq:recv-string requester)))))))

(json-client)
