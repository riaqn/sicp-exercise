(define (tree-map f t)
  (if (list? t)
      (map (lambda (t) (tree-map f t)) t)
      (f t)))

(define (square-tree tree) (tree-map square tree))

(square-tree
 (list 1
       (list 2 (list 3 4) 5)
       (list 6 7)))

