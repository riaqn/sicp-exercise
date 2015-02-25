(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (remainder
          (square (expmod base (/ exp 2) m))
          m))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (fermat-test n)
  (define (try-it a)
    (= (expmod a n n) a))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((<= times 0) true)
        ((fermat-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (timed-prime-test n)
  (start-prime-test n (runtime)))

(define (start-prime-test n start-time)
  (let ((res (fast-prime? n (log n))))
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

