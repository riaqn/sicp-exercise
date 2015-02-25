(load "2.68.scm")

(define (adjoin-set x set)
  (if (null? set) (list x)
      (let* ((cur (car set))
             (weight-x (weight x))
             (weight-cur (weight cur)))
        (if (<= weight-x weight-cur)
            (cons x set)
            (cons cur (adjoin-set x (cdr set)))))))

(define (make-leaf-set pairs)
  (if (null? pairs)
      '()
      (let ((pair (car pairs)))
        (adjoin-set (make-leaf (car pair)
                               (cadr pair))
                    (make-leaf-set (cdr pairs))))))

(define (generate-huffman-tree pairs)
  (successive-merge (make-leaf-set pairs)))

(define (successive-merge trees)
  (if (= (length trees) 1)
      (car trees)
      (let ((smallest-1 (car trees))
            (smallest-2 (cadr trees)))
        (successive-merge (adjoin-set (make-code-tree smallest-1 smallest-2) (cddr trees))))))

(define sample-tree (generate-huffman-tree '((A 5) (B 4) (C 3) (D 2) (E 1))))

(decode (encode '(B C A B D E) sample-tree) sample-tree)
