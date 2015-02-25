                                        ;Let implement (while <predicate> <body>)


(while <predicate> <body>)

(let while-iter ()
  (if <predicate>
      (begin (begin <body>)
             (while-iter))))

;the above two is equivalent
      
      
(define (while->combination exp)
  (let ((predicate (cadr exp))
        (body (caddr exp)))
    (list 'let 'while-iter '()
          (list 'if predicate
                (list 'begin (cons 'begin body)
                      (list 'while-iter))))))
