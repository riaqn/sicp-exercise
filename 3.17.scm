(define (count-pairs x)
  (define (count number x to-be-count counted)
    (define (find-eq? x l)
      (if (null? l)
          false
          (if (eq? x (car l))
              true
              (find-eq? x (cdr l)))))
    
    (define (count-right number to-be-count counted)
      (if (null? to-be-count)
          number
          (count number (car to-be-count) (cdr to-be-count) counted)))
    
    (if (pair? x)
        (if (find-eq? x counted)
            (count-right number to-be-count counted)
            (count (1+ number) (car x) (cons (cdr x) to-be-count) (cons x counted)))
        (count-right number to-be-count counted)))
  
  (count 0 x '() '()))

(define x '(a b c))
(define y (cons x x))
(define z (cons y y))


(count-pairs x)
(count-pairs y)
(count-pairs z)

(set-cdr! (cdr (cdr x)) x)
(count-pairs x)
