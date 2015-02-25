(let ((f (lambda () 0)))
  (f))

((lambda (f) (f))
 (lambda () 0))

(eval '(f) env:(f=('thunk (lambda () 0))))

;if the operator is not forced, then the application will fail, since f is a thunk.
