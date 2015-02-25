(define (sub-poly p1 p2)
  (add-poly p1 (neg-poly p2)))

(define (neg-poly p)
  (define (neg-term-list l)
    (let ((t (first-term l))
          (l0 (rest-term l)))
      (adjoin-term (make-term (order t) (neg (coeff t))) l0)))
  (make-term-list (variable p) (neg-term-list (term-list p))))

(put 'neg '(poly) neg-poly)
(put 'sub '(poly) sub-poly)
