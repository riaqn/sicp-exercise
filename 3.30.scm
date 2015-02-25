(define (ripple-carry-addr a b s c)
  (define (iter a b s cin)
    (if (null? a)
        true
        (let ((cout (make-wire)))
          (full-adder (car a) (car b) cin (car s) cout)
          (iter (cons a) (cons b) (cons s) cout))))
  (let ((cn (make-wire)))
    (set-signal! cn 0)
    (iter a b s cn)))

;about the delay, huge, I guess ;D
