(define (smallest-divisor n) (find-divisor n 2))
(define (next n)
  (if (= n 2)
      3
      (+ n 2)))
(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
        ((divides? test-divisor n) test-divisor)
        (else (find-divisor n (next test-divisor)))))
(define (divides? a b) (= (remainder b a) 0))

(define (prime? n)
  (= n (smallest-divisor n)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (let ((res (prime? n)))
    (if res
        (list (newline)
              (report-prime (- (runtime) start-time))
              (display n)))
    res))

(define (report-prime elapsed-time)
  (display " *** ")
  (display elapsed-time)
  )

(define (smallest-prime n)
  (if (timed-prime-test n)
      n
      (smallest-prime (+ 1 n))))

(define (smallest-three-prime n)
  (smallest-prime (+ 1 (smallest-prime (+ 1 (smallest-prime n))))))

(smallest-three-prime 1000)
(smallest-three-prime 100000)
(smallest-three-prime 10000000)
(smallest-three-prime 1000000000)

