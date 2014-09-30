;; testframework.lisp

(defun test (function-as-lst expected-result)
	(test-options function-as-lst (list expected-result)))

(defun test-options (function-as-lst expected-result-lst)
	(progn
		(format T "Evaluating ~A, expecting ~A" function-as-lst (first expected-result-lst))
		(mapcar #'(lambda (x) (format T " or ~A" x)) (rest expected-result-lst))
		(format T "~%")
		(let* ((result (eval function-as-lst)) (passed (satisfies-options result expected-result-lst)))
			(progn
				(format T "Got: ~A~%Passed: ~A~%~%" result passed)
				(if passed
					'(1 1)
					'(0 1))))))

(defun satisfies-options (result expected-result-lst)
	(if (member T (mapcar #'(lambda (x) (equal result x)) expected-result-lst))
		T
		NIL))

(defun test-many (tests-lst)
	(test-many-recur tests-lst '(0 0)))

(defun test-many-recur (tests-lst score)
	(if (equal tests-lst NIL)
		score
		(test-many-recur (rest tests-lst) (let ((test-result (first tests-lst)))
			(list (+ (first test-result) (first score)) 
				(+ (second test-result) (second score)))))))

(defun test-report (tests-lst)
	(let ((score (test-many tests-lst)))
		(format T "Test Report:~%============~%~A tests ran~%~A tests passed~%~A tests failed~%~%" 
			(second score) (first score) (- (second score) (first score)))))