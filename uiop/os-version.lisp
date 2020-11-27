(require :uiop)

;;; Run "python3 os_version.py" synchronously:
(let ((response (uiop:run-program '("python3" "os_version.py") :output :string)))
  response)

;;; Or:
(with-output-to-string (response)
  (uiop:run-program '("python3" "os_version.py") :output response)
  response)
