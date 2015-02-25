(define (if-cycle? l)
  (define (loop l l0)
    (define (find-eq? x l)
      (if (null? l)
          false
          (if (eq? x (car l))
              true
              (find-eq? x (cdr l)))))
    (if (null? l)
        false
        (if (find-eq? l l0)
            true
            (loop (cdr l) (cons l l0)))))

  (loop l '()))

(define x '(a b c d))
(if-cycle? x)
(set-cdr! (cdddr x) (cdr x))

(if-cycle? x)


