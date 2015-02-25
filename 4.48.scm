(define (parse-simple-noun-phrase)
  (list 'simple-noun-phrase
        (parse-word articles)
        (parse-adj-noun)))

;here I implement nouns with preceding adjectives.
;(a beautiful big bird) is parsed into
(simple-noun-phrase
 (article a)
 (adj-noun (adj beautiful)
           (adj-noun (adj big)
                     (noun bird))))
 
(define (parse-adj-noun)
  (amb (parse-noun)
       (list 'adj-noun
             (parse-adj)
             (parse-adj-noun))))

(define (parse-adj)
  (list 'adj
        (parse-word)))
