;since the foregoing label will be foregoing in the label list too, and the lookup is performed from front to back, so the fist here label will be used. a should be 3.

(define (extract-labels text receive)
  (if (null? text)
      (receive '() '())
      (extract-labels
       (cdr text)
       (lambda (insts labels)
         (let ((next-inst (car text)))
           (if (symbol? next-inst)
               (let check ((label next-inst)
                           (labels labels))
                 (if (null? labels)
                     (receive insts
                              (cons (make-label-entry next-inst
                                                      insts)
                     (if (eq? (caar labels) label)
                         (error "duplicated label")
                         (check label (cdr labels)))))
                              labels))
               (receive (cons (make-instruction next-inst)
                              insts)
                        labels)))))))
