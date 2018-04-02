#|
  This file is a part of dr-mario project.
  Copyright (c) 2018 hennin (hennin.ltn@gmail.com)
|#

(defsystem "dr-mario-test"
  :defsystem-depends-on ("prove-asdf")
  :author "hennin"
  :license "MIT"
  :depends-on ("dr-mario"
               "prove")
  :components ((:module "tests"
                :components
                ((:test-file "dr-mario")
                 (:module "utils"
                  :components
                  ((:test-file "list")
                   (:test-file "string")
                   (:test-file "macros"))))))
  :description "Test system for dr-mario"

  :perform (test-op (op c) (symbol-call :prove-asdf :run-test-system c)))
