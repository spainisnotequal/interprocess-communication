(require :jsonrpc)

(defvar *server* (jsonrpc:make-server))
(defparameter *port* 50879) ; as a number, not as string

(jsonrpc:expose *server* "sum" (lambda (args) (reduce #'+ args)))

(jsonrpc:server-listen *server* :port *port* :mode :tcp)
