;(insert-queue! q1 'a)
;insert a to q1, so both the front and rear point to the single pair
;whose car is a and cdr is nil
;so ((a) a)

;(insert-queue! q1 'b)
;insert b to q1, so the rear pointer moved to a newly created pair,
;whois car is b and cdr is nil. the cdr of the old rear pair, change
;to the new pair, too.
;the front pointer remain unchanged.
;so ((a b) b)

;(delete-queue! q1)
;the front pointer move forward.and the rear pointer
;unchanged.
;((b) b)

;(delete-queue! q1)
;the front pointer move forward, while the rear pointer unchanged 
;(() b)
(define (print-queue q)
  (display (car q)))
