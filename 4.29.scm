;e.g. a recursive version of fibonacci function will gain giant
;performance impove with memorization.

(define (fib n)
  (if (< n 2)
      1
      (+ (fib (- n 1)) (fib (- n 2)))))

100

1 (memorized)

2 (not memorized)
