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

(define (fermat-test n a)
    (= (expmod a n n) a))

(define (slow-prime-at n a)
  (cond ((= a n) true)
        ((fermat-test n a) (slow-prime-at n (+ a 1)))
        (else false)))

(define (slow-prime? n)
  (slow-prime-at n 1))

 (slow-prime? 561)
 (slow-prime? 1105)
 (slow-prime? 1729)
 (slow-prime? 2465)
 (slow-prime? 2821)
(slow-prime? 6601)
