;a.We have dispatched different operators into different handlers.
;we cannot dispatch these two predicates, since they have no operator.

(define (install-sum-package)
  (define (deriv-sum ops var)
    (make-sum (deriv (car ops) var)
              (deriv (cadr ops) var)))
  (define (deriv-product ops var)
    (make-sum (make-product (deriv (car ops) var)
                            (cadr ops))
              (make-product (deriv (cadr ops) var)
                            (car ops))))
  (define (deriv-exponent ops var)
    (make-product
     (make-product (cadr ops) (make-exponent (car ops) (-1+ (cadr ops))))
     (deriv (car ops) var)))
  (put 'deriv '* deriv-product)
  (put 'deriv '+ deriv-sum)
  (put 'deriv '** deriv-exponent)

; following lines is for d
  (put '* 'deriv deriv-product)
  (put '+ 'deriv deriv-sum)
  (put '** 'deriv deriv-sum))

