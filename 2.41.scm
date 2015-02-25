(define (enumerate-interval a b)
  (if (> a b)
      '()
      (cons a (enumerate-interval (1+ a) b))))

(define (accumulate op init seq)
  (if (null? seq)
      init
      (op (car seq) (accumulate op init (cdr seq)))))
 
(define (flatmap proc seq)
  (accumulate append '() (map proc seq)))

(define (unique-triples n)
  (flatmap (lambda (i)
             (flatmap (lambda (j)
                        (map (lambda (k) (list i j k))
                             (enumerate-interval 1 (- j 1))))
                      (enumerate-interval 1 (- i 1))))
           (enumerate-interval 1 n)))

(define (equal-sum-pairs n s)
  (filter (lambda (p) (= (+ (car p)
                            (cadr p)
                            (caddr p)) s))
          (unique-triples n)))

(equal-sum-pairs 10 20)
