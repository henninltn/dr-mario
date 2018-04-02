(in-package :cl-user)
(eval-when (:compile-toplevel :load-toplevel :execute)
  (unless (find-package :dr-mario)
    (defpackage dr-mario
      (:use :cl)
      (:import-from :dr-mario.graphics
                    :generate-control-string
                    :generate-reset-string)
      (:export :run))))
(in-package :dr-mario)

(defun run ()
  (format t "~sControl string~s~c"
          (generate-control-string :yellow :blue '(:bold :underline))
          (generate-reset-string)
          #\newline))

