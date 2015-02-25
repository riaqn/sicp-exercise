(define (accumulate op initial sequence)
  (if (null? sequence)
      initial
      (op (car sequence)
          (accumulate op initial (cdr sequence)))))

(define (accumulate-n op init seqs)
  (if (null? (car seqs))
      '()
      (cons (accumulate op init (map car seqs))
            (accumulate-n op init (map cdr seqs)))))

(define m '((1 2 3) (4 5 6) (7 8 9)))
(define v '(3 6 9))

(define (dot-product v w)
  (accumulate + 0 (map * v w)))

(define (matrix-*-vector m v)
  (map (lambda (vec) (dot-product vec v)) m))

(matrix-*-vector m v)

(define (transpose mat)
  (accumulate-n (lambda (x y) (cons x y)) '() mat))

(transpose m)

(define (matrix-*-matrix m n)
  (let ((cols (transpose n)))
    (map (lambda (col) (matrix-*-vector cols col)) m)))

(matrix-*-matrix m m)
