(define (square-tree t)
  (if (pair? t)
      (cons (square-tree (car t)) (square-tree (cdr t)))
      (if (null? t)
          '()
          (square t))))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

(define (square-tree t)
  (if (list? t)
      (map square-tree t)
      (square t)))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

  
