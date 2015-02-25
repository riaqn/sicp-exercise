;O(n)
(define (element-of-set? x set)
  (cond ((null? set) false)
        ((equal? x (car set)) true)
        (else (element-of-set? x (cdr set)))))

;O(1)
(define (adjoin-set x set)
  (cons x set))


;O(n)
(define (intersection-set set1 set2)
  (cond ((null? set1) set2)
        ((element-of-set? (car set1) set2)
         (cons (car set1) (intersection-set (cdr set1) set2)))
        (else (intersection-set (cdr set1) set2))))

;O(1)
(define (union-set set1 set2)
  (append set1 set2))

;I would like to use this set implementation in some union-heavy situations
;if memory consume is not the concern.
