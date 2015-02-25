;consider the (parse-perpositional-phrase) as an example:
(define (parse-prepositional-phrase)
  (list 'prep-phrase
        (parse-word prepositions)
        (parse-noun-phrase)))

;if the operand is evaluated from right to left, which means
;(parse-noun-phrase) is evaluated before (parse-word), then for a
;input like (in the class), 'in' will be recognized as the
;begining of some noun-phrase, which lead to mistake.

