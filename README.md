lisp-test-framework
===================

testframework.lisp is the primary file, everything else in this directory is an example.

testframework-example-test.lisp provides usage examples, testing functions defined in testframework-example-src.lisp.  The way this file is set up, it will run all tests automatically when loaded

It is of note that the test and test-options functions expect their arguments to be quoted.  This allows the framework to print out inputs before evaluating them.

A little about how it works:
---------------------------
the test, test-options, and test-many functions all return a tuple (a b) where a is the number of tests passed, and b is the number of tests ran.  test-report takes a list of these tuples, therefore it can take as arguments any combination of test, test-options, test-many, or a function that return the outputs thereof.

Example output:
---------------
    Evaluating (ADD 2 4), expecting 6
    Got: 6
    Passed: T
  
    Evaluating (ADD 13 12), expecting 20
    Got: 25
    Passed: NIL
  
    Evaluating (MULT 1 2), expecting 2
    Got: 2
    Passed: T
    
    Evaluating (MULT 3 4), expecting 7
    Got: 12
    Passed: NIL
    
    Evaluating (MULT 8 8), expecting 64
    Got: 64
    Passed: T
    
    Evaluating (RAND-ZERO-TO-TWO), expecting 0 or 1 or 2
    Got: 1
    Passed: T
    
    Evaluating (RETURN-SOME-FORM-OF-A), expecting A or (A)
    Got: (A)
    Passed: T
    
    Evaluating (RETURN-SOME-FORM-OF-A), expecting B
    Got: (A)
    Passed: NIL
    
    Test Report:
    ============
    8 tests ran
    5 tests passed
    3 tests failed
