(load "testframework-example-src.lisp") ;; load your source
(load "testframework.lisp") ;; load the test framework

;; for the sake of example, I have purposely specified expected imputs that will result in failed tests

(defun add-test ()
	(test-many (list
		(test '(add 2 4) 6)
		(test '(add 13 12) 20))))

(defun mult-test ()
	(test-many (list
		(test '(mult 1 2) 2)
		(test '(mult 3 4) 7)
		(test '(mult 8 8) 64))))

(defun rand-zero-to-two-test ()
	(test-options '(rand-zero-to-two) '(0 1 2)))

(defun return-some-form-of-A-test ()
	(test-many (list
		(test-options '(return-some-form-of-A) '(a (a)))
		(test '(return-some-form-of-A) 'b))))

(test-report (list
	(add-test)
	(mult-test)
	(rand-zero-to-two-test)
	(return-some-form-of-A-test)))