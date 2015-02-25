(define (make-tree entry left right) (list entry left right))
(define (entry tree) (car tree))
(define (left-branch tree) (cadr tree))
(define (right-branch tree) (caddr tree))

(define (tree->list tree)
  (define (copy-to-list tree result-list)
    (if (null? tree)
        result-list
        (copy-to-list (left-branch tree)
                      (cons (entry tree)
                            (copy-to-list (right-branch tree)
                                          result-list)))))
  (copy-to-list tree '()))

(define (list->tree elts)
  (define (partial-tree elts n)
    (if (= n 0)
        (cons '() elts)
        (let* ((left-size (quotient (- n 1) 2))
               (left-result (partial-tree elts left-size))
               (left-tree (car left-result))
               (non-left-elts (cdr left-result))
               (this-entry (car non-left-elts))
               (right-size (- n (+ left-size 1)))
               (right-result (partial-tree (cdr non-left-elts) right-size))
               (right-tree (car right-result))
               (remaining-elts (cdr right-result)))
          (cons (make-tree this-entry
                           left-tree
                           right-tree)
                remaining-elts))))
  (car (partial-tree elts (length elts))))


(define (union-list set1 set2)
  (cond ((null? set1) set2)
        ((null? set2) set1)
        (else
         (let ((car1 (car set1))
               (car2 (car set2))
               (cdr1 (cdr set1))
               (cdr2 (cdr set2)))
           (cond ((= car1 car2) (cons car1 (union-list cdr1 cdr2)))
                 ((< car1 car2) (cons car1 (union-list cdr1 set2)))
                 ((> car1 car2) (cons car2 (union-list set1 cdr2))))))))
                 
(define (union-set tree1 tree2)
  (let ((list1 (tree->list tree1))
         (list2 (tree->list tree2)))
    (list->tree (union-list list1 list2))))

(define (intersection-list set1 set2)
  (if (or (null? set1) (null? set2))
      '()
      (let ((car1 (car set1))
            (car2 (car set2))
            (cdr1 (cdr set1))
            (cdr2 (cdr set2)))
        (cond ((= car1 car2) (cons car1 (intersection-list cdr1 cdr2)))
              ((< car1 car2) (intersection-list cdr1 set2))
              ((> car1 car2) (intersection-list set1 cdr2))))))

(define (intersection-set tree1 tree2)
  (let ((list1 (tree->list tree1))
        (list2 (tree->list tree2)))
    (list->tree (intersection-list list1 list2))))

(tree->list (list->tree '(1 3 5 7 9)))

(tree->list (union-set (list->tree '(1 3 5 7 9)) (list->tree '(2 3 5 7))))
(tree->list (intersection-set (list->tree '(1 3 5 7 9)) (list->tree '(2 3 5 7))))

