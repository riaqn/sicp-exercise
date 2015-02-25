(stream-filter
 (lambda (x) (not (null? x)))
 (stream-map
 (lambda (baker cooper fletcher miller smith)
   (if (and (not (= baker 5))
        (not (= cooper 1))
        (not (= fletcher 5))
        (not (= fletcher 1))
        (> miller cooper)
        (not (= (abs (- smith fletcher)) 1))
        (not (= (abs (- fletcher cooper)) 1)))
       (list baker cooper fletcher miller smith)
       '()))))
