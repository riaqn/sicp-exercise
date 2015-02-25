(define (make-mobile left right)
  (list left right))

(define (make-branch length structure)
  (list length structure))

(define (left-branch m)
  (car m))

(define (right-branch m)
  (car (cdr m)))

(define (branch-length b)
  (car b))

(define (branch-structure b)
  (car (cdr b)))

(define (total-weight m)
  (if (pair? m)
      (+ (total-weight (branch-structure (left-branch m))) (total-weight (branch-structure (right-branch m))))
      m))

(define (balanced-mobile? m)
  (if (pair? m)
      (let* ((lb (left-branch m))
             (rb (right-branch m))
             (lw (balanced-mobile? (branch-structure lb)))
             (rw (balanced-mobile? (branch-structure rb))))
        (if (and (positive? lw) (positive? rw)
                 (= (* lw (branch-length lb)) (* rw (branch-length rb))))
            (+ lw rw)
            0))
      m))

(define m (make-mobile (make-branch 1 (make-mobile (make-branch 1 1)
                                                   (make-branch 2 1)))
                       (make-branch 2 1)))

(total-weight m)
(balanced-mobile? m)
