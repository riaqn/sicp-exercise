(define (sqrt x)
  (define (good-enough? guess)
    (< (abs (- (square guess) x)) 0.001))
  (define (improve guess)
    (average guess (/ x guess)))
  (define (sqrt-iter guess)
    (if (good-enough? guess)
        guess
        (sqrt-iter (improve guess))))
  (sqrt-iter 1.0))

(controller
 (assign guess (const 1.0))
 sqrt-iter
 (test (op good-enough?) (reg guess))
 (branch (label sqrt-iter-done))
 (assign (guess (op improve) (reg guess)))
 (goto (label sqrt-iter))
 sqrt-iter-done)

;good-enough?
(controller
 (assign t (op square) (reg guess))
 (assign t (op -) (reg t) (reg x))
 (assign t (op abs) (reg t))
 (test (op <) (reg t) (const 0.001)))

;improve
(controller
 (assign t (op /) (reg x) (reg guess))
 (assign t (op average) (reg guess) (reg t)))
