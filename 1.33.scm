(define (filtered-accumulate combiner null-value term a next b filter)
  (if (> a b)
      null-value
      (combiner
       (if (filter a)
           (term a)
           null-value)
       (accumulate-rec combiner null-value term (next a) next b))
          ))

(filtered-accumulate + 0 square a (lambda (x) (+ x 1)) b prime?)
(filtered-accumulate * 1 (lambda (x) x) 1 (lambda (x) (+ x 1)) n (lambda (x) (= (gcd x n) 1)))
