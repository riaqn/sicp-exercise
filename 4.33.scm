;we have to modify the (text-of-quotation)

(define (text-of-quotation exp)
  (let ((quoted (cadr exp)))
    (if (pair? quoted)
        (lambda (m) (m (car quoted) (cdr quoted)))
        quoted)))
