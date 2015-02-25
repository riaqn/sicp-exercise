(load "3.3.scm")

(define (make-joint acc pass newpass)
  (define (incorrect-password . l)
    "Incorrect joint password")
  
  (define (dispatch p m)
    (if (eq? p newpass)
        (acc pass m)
        incorrect-password))

  dispatch)


(define acc (make-account 100 'motherfucker))

(define jacc (make-joint acc 'motherfucker 'fatherfucker))

((jacc 'fatherfucker 'withdraw) 50)
((jacc 'motherfucker 'withdraw) 50)

