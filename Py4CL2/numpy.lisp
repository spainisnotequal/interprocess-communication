(require :py4cl2)

(py4cl2:defpymodule "numpy" nil :lisp-package "NP")

(np:arange :start 0 :stop 1 :step 0.1)
