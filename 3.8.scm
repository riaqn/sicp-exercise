(define f
  (let ((rec -1))
    (lambda (x)
      (if (< rec 0)
          (begin (set! rec x)
                 0)
          (set! rec x)))))

(+ (f 0) (f 1))

(f -1)

(list (f 0) (f 1))

