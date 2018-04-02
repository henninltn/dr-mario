#|
  This file is a part of dr-mario project.
  Copyright (c) 2018 hennin (hennin.ltn@gmail.com)
|#

#|
  Author: hennin (hennin.ltn@gmail.com)
|#

(defsystem "dr-mario"
  :version "0.1.0"
  :author "hennin"
  :license "MIT"
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "dr-mario"))))
  :description "Puzzle game like Dr.MARIO"
  :long-description
  #.(read-file-string
     (subpathname *load-pathname* "README.markdown"))
  :in-order-to ((test-op (test-op "dr-mario-test"))))
