;l is a list [0, n]
;this procudure will delete and return a random element with range (0,n]
(define (random-select l)
  (define (iter l i)
    (if (= i 0)
        (let ((val (cadr l)))
          (set-cdr! l (cddr l))
          val)
        (iter (cdr l) (- i 1))))
  (iter l (random (length l))))
        
(define (analyze-ramb exp)
  (let ((cprocs (cons '() (map analyze (amb-choices exp)))))
    (lambda (env succeed fail)
      (define (try-next)
        (if (null? cprocs)
            (fail)
            (begin
              (random-select )
              ((random-select cprocs) env
               succeed
               (lambda ()
                 (try-next))))))
      (try-next))))

;with ramb, Alyssa can generate some different sentences everytime she
;run her program, rather than same sentences every time. 
