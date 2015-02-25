;no, it won't work. Note that when we choose the second branch at the
;(amb) clause, we call (parse-verb-phrase), with the *unparsed*
;unchanged. It means that our state is just as same as we call
;(parse-verb-phrase) at first. this apparantly lead to a infinite loop.



;interchanging the order of expressions may be even more wrong.

(define (parse-verb-phrase)
  (amb (list 'verb-phrase
             (parse-verb-phrase)
             (parse-prepositional-phrase)))
  (parse-word verbs))

;when (parse-verb-phrase) is called, we encounter a amb. First branch
;is choosed, we then call (parse-verb-phrase), which lead to infinite
;loop instantly.
