a. (assign n (reg val))
(restore val)

can be reduced to
(restore n)

;b

(define (make-save inst machine stack pc)
  (let ((reg (get-register machine (stack-inst-reg-name inst))))
    (lambda ()
      (push stack (reg (get-contents reg)))
      (advance-pc pc))))

(define (make-restore inst machine stack pc0)
  (let ((reg (get-register machine
                           (stack-inst-reg-name inst))))
    (lambda ()
      (let ((p (pop stack)))
        (if (eq? (car p) reg)
            (cdr p)
            (error "not the same register"))
        (advance-pc pc)))))

;c
(define (make-save inst machine stack pc)
  (let ((reg (get-register machine
                           (stack-inst-reg-name inst))))
    (lambda ()
      (let ((iter
             (lambda (stack)
               (if (null? stack)
                   (cons reg (get-contents reg))
                   (begin
                   (set-cdr! (car stack)
                             (if (eq? reg (caar stack))
                                 (cons (get-contents reg)
                                       (cdar stack)))
                             (iter (cdr stack)))
                   stack)))))
        (iter stack))
      (advance-pc pc))))

(define (make-restore inst machine stack pc)
  (let ((reg (get-register machine
                           (stack-inst-reg-name inst))))
    (lambda ()
      (let ((iter
             (lambda (stack
                  (if (null? stack)
                      (error "correspoding stack not found")
                      (if (eq? reg (caar stack))
                          (set-contents! reg (cdar stack))
                          (iter (cdr stack))))))))
        (iter stack))
      (advance-pc pc))))

                      
