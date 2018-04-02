(in-package :cl-user)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (unless (find-package :dr-mario)
    (defpackage dr-mario
      (:use :cl)
      (:import-from :dr-mario.graphics
                    :get-style
                    :get-foreground
                    :get-background)
      (:export :run))))
(in-package :dr-mario)

(defun run ()
  (format t "~sBold!~c" (get-style :bold) #\newline))

