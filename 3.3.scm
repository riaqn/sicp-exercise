(define (make-account balance password)
  (define (withdraw amount)
    (if (>= balance amount)
        (begin (set! balance (- balance amount))
               balance)
        "insufficient funds"))

  (define (deposit amount)
    (set! balance (+ balance amount))
    balance)

  (define (incorrect-password . l)
    "Incorrect password")

  (define (dispatch p m)
    (if (eq? password p)
        (cond ((eq? m 'withdraw) withdraw)
              ((eq? m 'deposit) deposit)
              (else (error "Unknown request: MAKE-ACCOUNT" m)))
        incorrect-password))
  dispatch)

(define acc (make-account 100 'motherfucker))

((acc 'fatherfucker 'withdraw) 40)

((acc 'motherfucker 'deposit) 50)
