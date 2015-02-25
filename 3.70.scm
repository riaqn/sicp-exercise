(define (merge-weighted s1 s2 weight)
  (cond ((stream-null? s1) s2)
        ((stream-null? s2) s1)
        (else
         (let* ((p1 (stream-car s1))
                (p2 (stream-car s2))
                (w1 (weight p1))
                (w2 (weight p2)))
           (if (< w1 w2)
               (cons-stream p1 (merge-weighted (stream-cdr s1) s2 weight))
               (cons-stream p2 (merge-weighted (stream-cdr s2) s1 weight)))))))

(define (weighted-pairs s t weight)
  (cons-stream
   (list (stream-car s) (stream-car t))
   (merge-weighted
    (stream-map (lambda (x) (list (stream-car s) x)) (stream-cdr t))
    (weighted-pairs (stream-cdr s) (stream-cdr t))
    weight)))

(define s1 (weighted-pairs integers integers (lambda (p) (+ (car p) (cadr p)))))

(define (legal n)
  (and (not (= (remainder n 2) 0))
       (not (= (remainder n 3) 0))
       (not (= (remainder n 5) 0))))
       
(define s2 (stream-filter (lambda (p) (and (legal (car p)) (legal (cadr p))))
                          (weighted-pairs integers integers (lambda (p) (+ (* 2 (car p)) (* 3 (cadr p)) (* 5 (caddr p)))))))

