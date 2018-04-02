(in-package :cl-user)
(defpackage dr-mario-utils.string
  (:use :cl)
  (:export :join))
(in-package :dr-mario-utils.string)


(defun join (separator list)
  (reduce (lambda (v accum)
            (concatenate 'string accum (write-to-string separator) v))
          list))

