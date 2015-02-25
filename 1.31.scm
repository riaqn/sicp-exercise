(define (product-rec term a next b)
  (if (> a b)
      1
      (* (term a) (product-rec term (next a) next b))))

(define (product-iter term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (* (term a) result))))
  (iter a 1))


(define (identify n) n)
(define (inc n) (+ n 1))

(define (factorial-rec n)
  (product-rec identify 1 inc n))

(define (factorial-iter n)
  (product-iter identify 1 inc n))

(factorial-rec 10)
(factorial-iter 10)

(define (temp n)
  (/ (if (odd? n)
         (+ n 1)
         (+ n 2))
     (if (odd? n)
         (+ n 2)
         (+ n 1))))

(exact->inexact (* 4 (product-iter temp 1 inc 10000)))
