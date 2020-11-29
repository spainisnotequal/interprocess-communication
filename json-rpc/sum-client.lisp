(require :jsonrpc)

(defvar *client* (jsonrpc:make-client))
(defparameter *host* "http://localhost")
(defparameter *port* "50879") ; as a string, to use it in concatenate without coercing a number first
(defparameter *url* (concatenate 'string *host* ":" *port*))

(jsonrpc:client-connect *client* :url *url* :mode :tcp)
(jsonrpc:call *client* "sum" '(10 20))
;=> 30

;; Calling with :timeout option
(jsonrpc:call *client* "sum" '(10 20) :timeout 1.0)
;=> 30
