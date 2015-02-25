;This is a more clean representation compared to the origin one
(define (make-code-tree left right)
  (list (append (symbols left) (symbols right))
        (+ (weight left) (weight right))
        left
        right))

(define (make-leaf symbol weight)
  (list (list symbol)
        weight
        '()
        '()))

(define (symbols tree) (car tree))
(define (symbol-leaf tree) (car (symbols tree)))
(define (weight tree) (cadr tree))
(define (left-branch tree) (caddr tree))
(define (right-branch tree) (cadddr tree))

(define (leaf? tree) (= (length (symbols tree)) 1))

(define sample-tree
  (make-code-tree (make-leaf 'A 4)
                  (make-code-tree
                   (make-leaf 'B 2)
                   (make-code-tree
                    (make-leaf 'D 1)
                    (make-leaf 'C 1)))))

(define sample-message '(0 1 1 0 0 1 0 1 0 1 1 1 0))

(define (decode bits tree)
  (define (decode-1 bits current-branch)
    (if (null? bits)
        '()
        (let ((next-branch
               (choose-branch (car bits) current-branch)))
          (if (leaf? next-branch)
              (cons (symbol-leaf next-branch)
                    (decode-1 (cdr bits) tree))
              (decode-1 (cdr bits) next-branch)))))
  (decode-1 bits tree))

(define (choose-branch bit branch)
  (cond ((= bit 0) (left-branch branch))
        ((= bit 1) (right-branch branch))
        (else (error "bad bit: CHOOSE-BRANCH" bit))))

(decode sample-message sample-tree)
