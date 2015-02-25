;Just replacing (an-integer-between) by (an-integer-starting-from) is
;not adequate, since in the process of trying, the most recent point,
;which is k in this case, is tried over and over again. So the trace
;is like (1 1 1) (1 1 2) (1 1 3) ..., the i and j will never change.

(define (a-pythagorean-triple-starting-from low)
  (let* ((k (an-integer-starting-from low))
         (i (an-integer-between 1 k))
         (j (an-integer-between i k)))
    (require (= (+ (* i i) (* j j)) (* k k)))
    (list i j k)))
    
