lisp-test-framework
===================

tm-testframework.lisp is the primary file, everything else in this directory is an example.

tm-testframework-example-test.lisp provides usage examples, testing functions defined in 
tm-testframework-example-src.  The way this file is set up, it will run all tests automatically 
when loaded

It is of note that the test and test-options functions expect their arguments to be quoted.  
This allows the framework to print out inputs before evaluating them.

A little about how it works:
---------------------------
the test, test-options, and test-many functions all return a tuple (a b) where a is 
the number of tests passed, and b is the number of tests ran.  test-report takes a list of these 
tuples, therefore it can take as arguments any combination of test, test-options, test-many, 
or a function that return the outputs thereof.
