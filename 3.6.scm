(define rand
  (let ((seed 0))
    (cond ((eq? arg 'generate) (set! seed (rand-update seed)))
          ((eq? arg 'reset) (lambda (newseed) (set! seed newseed))))))
