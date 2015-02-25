(define (union-set set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else
         (let ((car1 (car set1))
               (car2 (car set2))
               (cdr1 (cdr set1))
               (cdr2 (cdr set2)))
           (cond ((= car1 car2) (cons car1 (union-set cdr1 cdr2)))
                 ((< car1 car2) (cons car1 (union-set cdr1 set2)))
                 ((> car1 car2) (cons car2 (union-set set1 cdr2))))))))
        
(union-set '(1 3 5 7 9) '(2 3 5 7))
