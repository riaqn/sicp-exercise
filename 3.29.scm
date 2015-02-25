(define (or-gate a b output)
  (let ((not-a (make-wire))
        (not-b (make-wire))
        (not-ab (make-wire)))
    (inverter a not-a)
    (inverter b not-b)
    (and not-a not-b not-ab)
    (inverter not-ab output))
  'ok)

;the delay should be and-gate-delay + inverter-delay * 2

    
