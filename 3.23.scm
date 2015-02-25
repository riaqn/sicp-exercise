(define (make-deque)
  (let ((q (list '() '() '())))
    (set-car! q q)
    (set-car! (cdr q) q)
    q))

(define (prev q)
  (car q))

(define (set-prev! q q0)
  (set-car! q q0))

(define (next q)
  (cadr q))

(define (set-next! q q0)
  (set-car! (cdr q) q0))

(define (item q)
  (caddr q))

(define (set-item! q item)
  (set-car! (cddr q) item))

(define (empty-deque? q)
  (eq? q (next q)))

(define (begin-deque q)
  q)

(define (front-deque q)
  (item (begin-deque q)))

(define (end-deque q)
  (prev q))

(define (rear-deque q)
  (item (prev (end-deque q))))

(define (front-insert-deque! q item)
  (let ((new (make-deque))
        (end (end-deque q)))
    (set-item! new item)
    (set-prev! new end)
    (set-next! new q)
    (set-next! end new)
    (set-prev! q new)
    new))

(define (rear-insert-deque! q item)
  (let ((new (make-deque))
        (end (end-deque q)))
    (set-item! new item)
    (set-prev! new (prev end))
    (set-next! new end)
    (set-next! (prev end) new)
    (set-prev! end new)
    q))

(define (front-delete-deque! q)
  (let ((next (next q))
        (end (end-deque q)))
    (set-prev! next end)
    (set-next! end next)
    next))

(define (rear-delete-deque! q)
  (let* ((end (end-deque q))
         (prev (prev (prev end))))
    (set-prev! end prev)
    (set-next! prev end)
    (if (eq? (next q) end)
        end
        q)))

(define (print-deque q)
  (define (loop q0 count)
      (if (eq? (end-deque q) q0)
          count
          (begin (newline)
                 (display (item q0))
                 (loop (next q0) (1+ count)))))

  (loop q 0))
          

(define q (make-deque))
(print-deque q)
(empty-deque? q)

(begin (set! q (front-insert-deque! q 'a))
       (print-deque q))
(front-deque q)
(begin (set! q (rear-insert-deque! q 'b))
       (print-deque q))
(rear-deque q)
(begin (set! q (front-delete-deque! q))
       (print-deque q))
(front-deque q)
(begin (set! q (rear-delete-deque! q))
       (print-deque q))
