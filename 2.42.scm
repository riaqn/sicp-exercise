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

(define (queen board-size)
  (define (queen-cols k)
    (if (= k 0)
        (list empty-board)
        (filter
         (lambda (positions) (safe? k positions))
         (flatmap
          (lambda (rest-of-queens)
            (map (lambda (new-row)
                   (adjoin-position
                    new-row k rest-of-queens))
                 (enumerate-interval 1 board-size)))
          (queen-cols (- k 1))))))
  (queen-cols board-size))

(define (adjoin-position row k queens)
  (cons row queens))

(define empty-board '())

(define (safe? k pos)
  (define (iter i pos)
    (if (= (length pos) 1)
        true
        (cond ((= (car pos) (cadr pos)) false)
              ((= (abs (- (car pos) (cadr pos))) i) false)
              (else (iter (1+ i) (cons (car pos) (cddr pos)))))))
  (iter 1 pos))

(queen 8)
