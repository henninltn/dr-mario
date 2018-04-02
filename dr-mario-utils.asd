#|
  This file is a part of dr-mario project.
  Copyright (c) 2018 hennin (hennin.ltn@gmail.com)
|#

#|
  Author: hennin (hennin.ltn@gmail.com)
|#

(defsystem "dr-mario-utils"
  :version "0.1.0"
  :author "hennin"
  :license "MIT"
  :depends-on (:alexandria)
  :components ((:module "src/utils"
                :components
                ((:file "list")
                 (:file "string")
                 (:file "macros"))))
  :description "utility library for dr-mario"
  :long-description
  :in-order-to ((test-op (test-op "dr-mario-utils-test"))))
