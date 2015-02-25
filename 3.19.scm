(define (if-cycle? l)
  (define (loop l head pos)
    (define (find-pos x l pos)
      (if (null? l)
          -1
          (if (eq? x l)
              pos
              (find-pos x (cdr l) (1+ pos)))))
    (if (null? l)
        false
        (if (= (find-pos l head 0) pos)
            (loop (cdr l) head (1+ pos))
            true)))
  (loop l l 0))

(define x '(a b c d))
(if-cycle? x)
(set-cdr! (cdddr x) (cdr x))

(if-cycle? x)



    
