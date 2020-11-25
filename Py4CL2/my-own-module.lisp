(require :py4cl2)

;; The Python module should be located in $HOME/.local/lib/python3.7/site-packages
;; The following expression loads the module "my_own_module.py":
(py4cl2:defpymodule "my_own_module" nil :lisp-package "MOM")

;; To get the symbols (the names of the functions) imported in the package, use the following function:
(defun get-all-symbols (&optional package)
  (let ((lst ())
        (package (find-package package)))
    (do-all-symbols (s lst)
      (when (fboundp s)
        (if package
            (when (eql (symbol-package s) package)
              (push s lst))
            (push s lst))))
    lst))

;; The following expression will list every symbol from the package MOM:
(get-all-symbols 'mom)

;; Now, we can use the Python function add1(n):
(mom:add-1 :n 1)

;; And the Python function os_version():
(mom:os-version)
