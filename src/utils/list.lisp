(in-package :cl-user)
(defpackage dr-mario-utils.list
  (:use :cl)
  (:export :lastcar
           :lastcdr
           :take
           :drop
           :zip
           :flatten))
(in-package :dr-mario-utils.list)

(defun lastcar (xs)
  (car (reverse xs)))

(defun lastcdr (xs)
  (reverse (cdr (reverse xs))))

(defun take (n xs)
  (labels ((_take (n xs accum)
             (if (or (zerop n) (null xs))
                 (reverse accum)
                 (_take (1- n) (cdr xs) (cons (car xs) accum)))))
    (_take n xs nil)))

(defun drop (n xs)
  (if (or (zerop n) (null xs))
      xs
      (drop (1- n) (cdr xs))))

(defun flatten (xss)
  (reduce #'append xss))

(defun zip (xs ys)
  (reduce #'append
          (mapcar #'list xs ys)))
