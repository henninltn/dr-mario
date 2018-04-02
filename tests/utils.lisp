(defpackage dr-mario-test.utils
  (:use :cl
        :dr-mario.utils
        :prove))
(in-package :dr-mario-test.utils)

(plan 10)

;;
;; List
;;

(subtest
 "lastcar"
 (is (lastcar '(1 2 3))
     3)
 (is (lastcar nil)
     nil))

(subtest
 "lastcdr"
 (is (lastcdr '(1 2 3))
     '(1 2))
 (is (lastcdr nil)
     nil))

(subtest
 "take"
 (is (take 0 '(1 2 3))
     nil)
 (is (take 2 '(1 2 3))
     '(1 2))
 (is (take 3 '(1 2 3))
     '(1 2 3))
 (is (take 4 '(1 2 3))
     '(1 2 3)))

(subtest
 "drop"
 (is (drop 0 '(1 2 3))
     '(1 2 3))
 (is (drop 2 '(1 2 3))
     '(3))
 (is (drop 3 '(1 2 3))
     nil)
 (is (drop 4 '(1 2 3))
     nil))

(subtest
 "flatten"
 (is (flatten '((a b c) (1 2) ("aaa")))
     '(a b c 1 2 "aaa"))
 (is (flatten nil)
     nil)
 (is-error (flatten '((a b c) 1))
           'type-error))

(subtest
 "zip"
 (is (zip '(a b c) '(1 2 3))
     '(a 1 b 2 c 3))
 (is (zip '(a b) '(1 2 3))
     '(a 1 b 2))
 (is (zip '(a b c) '(1 2))
     '(a 1 b 2))
 (is (zip nil '(1 2 3))
     nil)
 (is (zip '(a b c) nil)
     nil)
 (is (zip nil nil)
     nil))

;;
;; String
;;

(subtest
 "join"
 (is (join #\, '(a b c d))
     "a,b,c,d")
 (is (join "," '(a b c d))
     "a,b,c,d")
 (is (join "" '(a b c d))
     "abcd")
 (is (join "," '(a))
     "a")
 (is (join "," nil)
     ""))

(subtest
 "split"
 (is ))

(finalize)
