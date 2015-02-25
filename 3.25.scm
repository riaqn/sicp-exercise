(define (make-table same-key?)
  (define (assoc key records)
    (if (null? records)
        false
        (if (same-key? key (caar records))
            (car records)
            (assoc key (cdr records)))))

  (let ((local-table (cons '*table* '())))
    (define (lookup keys)
      (define (iter keys record)
        (if (null? keys)
            record
            (let ((record (assoc (car keys) (cdr record))))
              (if record
                  (iter (cdr keys) record)
                  false))))
      (cdr (iter keys local-table)))
          
    (define (insert! keys value)
      (define (iter keys value record)
        (if (null? keys)
            (begin
              (set-cdr! record value)
              'ok)
            (let ((subrecord (assoc (car keys) (cdr record))))
              (if subrecord
                  (iter (cdr keys) value subrecord)
                  (begin
                    (set! subrecord (list (car keys)))
                    (set-cdr! record (cons subrecord (cdr record)))
                    (iter (cdr keys) value subrecord))))))
      (iter keys value local-table))
      
    (define (dispatch m)
      (cond ((eq? m 'lookup-proc) lookup)
            ((eq? m 'insert-proc!) insert!)
            (else (error "Unknown operation: TABLE" m))))
    dispatch))


(define (same-key? tol)
  (lambda (key1 key2)
    (if (< (abs (- key1 key2)) tol)
        true
        false)))

(define table (make-table (same-key? 0.75)))

((table 'insert-proc!) '(2 3) 'hello)
((table 'insert-proc!) '(2 5 6) 'nop)

((table 'lookup-proc) '(1.5 3.5))
((table 'lookup-proc) '(2.5 4.5 6.5))
                              
