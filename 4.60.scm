;it happens because it ought to.
;We have to setup a strict order of all persons, so that for any two
;persons, one is before the other. Then we can write a wrapper of
;lives-near, such that only when person1 is before person2, the pair
;is printed.
;For simplicity, the name string should be a good order, as long as no
;two have the same name.

;I am not sure if I could write a rule like this
(rule (all-near)
      (and (lives-near ?person1 ?person2)
           (lisp-value person< ?person1 ?person2)))
        

;stolen from http://community.schemewiki.org/?sicp-ex-4.60
(define (person->string person) 
  (if (null? person) 
      "" 
      (string-append (symbol->string (car person)) (person->string (cdr person))))) 
(define (person>? p1 p2) 
  (string>? (person->sring p1) (person->string p2))) 
