;Normally speaking, putting ahead restrictions that is more likely to
;fail, can improve the performance a little bit. It just save some
;time of testing the previous restrictions. 

;However, if we can put some restriction even before some amb clause,
;which means before some branch, that will improve the speed
                                        ;dramatically, here is an example.

;note that I only move the (not (= baker 5)) forward as an example, which reduces
;about 20% trying. You can move more restrictions forward, which,
;however, will make the code much uglier.

(define (multiple-dwelling)
  (let ((baker (amb 1 2 3 4 5)))
    (require (not (= baker 5)))
    (let ((cooper (amb 1 2 3 4 5))
          (fletcher (amb 1 2 3 4 5))
          (miller (amb 1 2 3 4 5))
          (smith (amb 1 2 3 4 5)))
      (require
       (distinct? (list baker cooper fletcher miller smith)))
      (require (not (= cooper 1)))
      (require (not (= fletcher 5)))
      (require (not (= fletcher 1)))
      (require (> miller cooper))
      (require (not (= (abs (- smith fletcher)) 1)))
      (require (not (= (abs (- fletcher cooper)) 1)))
      (list (list 'baker baker)
            (list 'cooper cooper)
            (list 'fletcher fletcher)
            (list 'miller miller)
            (list 'smith smith)))))

