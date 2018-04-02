(defpackage dr-mario
  (:use :cl)
  (:export :run))
(in-package :dr-mario)

(defun run ()
  (format t "Hello, world!~c" #\newline))

