;there is a extra frame because let is transformed to a lambda cluase,
                                        ;which will create a new frame.

                                        ;To get rid of the extra frame, consider this

(lambda <VARS>
  (define u <E1>)
  (define v <E2>)
  <E3>)

(lambda <VARS>
  (begin
    (define u '*unsigned*)
    (define v '*unsigned*))
  (begin
    (set! u <E1>)
    (set! v <E2>))
  <E3>)

;give the scan-out-defines
(define (scan-out-defines body)
  (let* ((defines (filter (lambda (x) (eq? (car x) 'define)) body))
         (vars (map cadr defines))
         (vals (map caddr defines)))
    (cons
     (cons 'begin
           (map (lambda (x) (list 'define x '*unassigned*)) vars))
     (cons
      (cons 'begin
            (map (lambda (x y) (list 'set! x y)) vars vals))
            (filter (lambda (x) (not (eq? (car x) 'define))) body)))))

