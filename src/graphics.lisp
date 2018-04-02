(in-package :cl-user)
(defpackage dr-mario.graphics
  (:use :cl)
  (:export :generate-control-string
           :generate-reset-string)
  (:import-from :dr-mario-utils.string
                :join)
  (:import-from :dr-mario-utils.macros
                :->))
(in-package :dr-mario.graphics)

(defconstant *foreground-colors* (make-hash-table))
(setf (gethash :default *foreground-colors*) 39)
(setf (gethash :black *foreground-colors*) 30)
(setf (gethash :red *foreground-colors*) 31)
(setf (gethash :green *foreground-colors*) 32)
(setf (gethash :yellow *foreground-colors*) 33)
(setf (gethash :blue *foreground-colors*) 34)
(setf (gethash :magenta *foreground-colors*) 35)
(setf (gethash :cyan *foreground-colors*) 36)
(setf (gethash :white *foreground-colors*) 37)
(setf (gethash :bright-black *foreground-colors*) 90)
(setf (gethash :bright-red *foreground-colors*) 91)
(setf (gethash :bright-green *foreground-colors*) 92)
(setf (gethash :bright-yellow *foreground-colors*) 93)
(setf (gethash :bright-blue *foreground-colors*) 94)
(setf (gethash :bright-magenta *foreground-colors*) 95)
(setf (gethash :bright-cyan *foreground-colors*) 96)
(setf (gethash :bright-white *foreground-colors*) 97)

(defconstant *background-colors* (make-hash-table))
(setf (gethash :default *foreground-colors*) 49)
(setf (gethash :black *background-colors*) 40)
(setf (gethash :red *background-colors*) 41)
(setf (gethash :green *background-colors*) 42)
(setf (gethash :yellow *background-colors*) 43)
(setf (gethash :blue *background-colors*) 44)
(setf (gethash :magenta *background-colors*) 45)
(setf (gethash :cyan *background-colors*) 46)
(setf (gethash :white *background-colors*) 47)
(setf (gethash :bright-black *background-colors*) 100)
(setf (gethash :bright-red *background-colors*) 101)
(setf (gethash :bright-green *background-colors*) 102)
(setf (gethash :bright-yellow *background-colors*) 103)
(setf (gethash :bright-blue *background-colors*) 104)
(setf (gethash :bright-magenta *background-colors*) 105)
(setf (gethash :bright-cyan *background-colors*) 106)
(setf (gethash :bright-white *background-colors*) 107)

(defconstant *styles* (make-hash-table))
(setf (gethash :bold *styles*) 1)
(setf (gethash :Italic *styles*) 3)
(setf (gethash :Underline *styles*) 4)
(setf (gethash :slow-blink *styles*) 5)
(setf (gethash :rapid-blink *styles*) 6)
(setf (gethash :double-underline *styles*) 21)

(defun get-code (key table)
  (multiple-value-bind (code exists)
      (gethash key table)
    (if exists
        code
        (error "'~a' doesn't exist in '~a'" key table))))



(defun generate-control-string (foreground background styles)
  (format nil "~c[~sm"
          #\esc
          (-> (cons (get-code foreground
                              *foreground-colors*)
                    (cons (get-code background
                                    *background-colors*)
                          styles))
              )
          (join ";"
                )))

(defun generate-reset-string ()
  (format nil "~c[m") #\esc)
