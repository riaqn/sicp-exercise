
(define (=zero?-poly poly)
  (define (=zero?-term-list term-list)
  (if (empty-termlist? term-list)
      true
      (if (=zero? (coeff (first-term term-list)))
          (=zero?-term-list (rest-term term-list))
          false)))
  (=zero?-term-list (term-list poly)))

(put '=zero? '(poly) =zero?-poly)
           
