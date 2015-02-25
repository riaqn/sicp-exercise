(define (make-from-mag-ang mag ang)
  (define (dispatch op)
    (cond ((= op 'magnitude) mag)
          ((= op 'angle) ang)
          ((= op 'real-part) (* mag (cos ang)))
          ((= op 'imag-part) (* mag (sin ang)))
          (else (error "Unknown op: MAKE-FROM-MAG-IMAG" op))))
  dispatch)

