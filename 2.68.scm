(load "2.67.scm")
(define (encode message tree)
  (define (encode-1 message current-branch)
    (if (null? message)
        '()
        (let* ((bit
                (choose-branch-symbol (car message) current-branch))
               (next-branch
                (choose-branch bit current-branch)))
          (if (leaf? next-branch)
              (cons bit (encode-1 (cdr message) tree))
              (cons bit (encode-1 message next-branch))))))
  (encode-1 message tree))

(define (choose-branch-symbol symbol branch)
  (define (find x list)
    (if (null? list)
        list
        (if (eq? x (car list))
            list
            (find x (cdr list)))))
  (cond ((not (null? (find symbol (symbols (left-branch branch))))) 0)
        ((not (null? (find symbol (symbols (right-branch branch))))) 1)
        (else (error "bad symbol: CHOOSE-BRANCH-SYMBOL" symbol))))

(decode (encode '(A B C D A B C) sample-tree) sample-tree)
