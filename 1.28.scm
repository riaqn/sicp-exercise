(define (expmod base exp m)
  (cond ((= exp 0) 1)
        ((even? exp)
         (let* ((tmp0 (expmod base (/ exp 2) m))
                (tmp1 (remainder (square tmp0) m)))
           (if (and (= tmp1 1) (not (or (= tmp0 1) (= tmp0 (- m 1)))))
               0
               tmp1)))
        (else
         (remainder
          (* base (expmod base (- exp 1) m))
          m))))

(define (miller-rabin-test n)
  (define (try-it a)
    (= (expmod a (- n 1) n) 1))
  (try-it (+ 1 (random (- n 1)))))

(define (fast-prime? n times)
  (cond ((<= times 0) true)
        ((miller-rabin-test n) (fast-prime? n (- times 1)))
        (else false)))

(define (prime? n)
  (fast-prime? n (log n)))

(prime? 561)
(prime? 1105)
(prime? 1729)
(prime? 2465)
(prime? 2821)
(prime? 6601)

(prime? 3)
(prime? 5)
(prime? 9)
(prime? 53)

