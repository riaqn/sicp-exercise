;The professor lectures to the student in the class with the cat.

;professor lectures, student in the class, student is with cat.
(sentence
 (simple-noun-phrase (article the) (noun professor))
 (verb-phrase
  (verb lectures)
  (prep-phrase (prep to)
               (noun-phrase
                (noun-phrase
                 (simple-noun-phrase
                  (article the) (noun student))
                 (prep-phrase (prep in)
                              (simple-noun-phrase
                               (article the) (noun class))))
                (prep-phrase (prep with)
                             (simple-noun-phrase
                              (article the) (noun cat)))))))

;professor lectures, student in the class, class is with the cat.
(sentence
 (simple-noun-phrase (article the) (noun professor))
 (verb-phrase
  (verb lectures)
  (prep-phrase (prep to)
                (noun-phrase
                 (simple-noun-phrase
                  (article the) (noun student))
                 (prep-phrase (prep in)
                              (noun-phrase
                               (simple-noun-phrase
                                (article the) (noun class))
                               (prep-phrase (prep with)
                                            (simple-noun-phrase
                                             (article the) (noun cat)))))))))

;professor lectures, student in the class, professor is with the cat
(sentence
 (simple-noun-phrase (article the) (noun professor))
 (verb-pharase
  (verb-phrase
   (verb lectures)
   (prep-phrase (prep to)
                (noun-phrase
                 (simple-noun-phrase
                  (article the) (noun student))
                 (prep-phrase (prep in)
                              (simple-noun-phrase
                               (article the) (noun class))))))
  (prep-phrase (prep with)
               (simple-noun-phrase
                (article the) (noun cat)))))

;professor lectures to students, professor is in the class and with
;the cat
(sentence
 (simple-noun-phrase (article the) (noun professor))
 (verb-pharase
  (verb-pharase
   (verb-phrase
    (verb lectures)
    (prep-phrase (prep to)
                  (simple-noun-phrase
                   (article the) (noun student))))
   (prep-phrase (prep in)
                (simple-noun-phrase
                 (article the) (noun class))))
  (prep-phrase (prep with)
               (simple-noun-phrase
                (article the) (noun cat)))))

;professor lecture to students, professor is in the class, and the
;class is with the cat.
(sentence
 (simple-noun-phrase (article the) (noun professor))
  (verb-pharase
   (verb-phrase
    (verb lectures)
    (prep-phrase (prep to)
                  (simple-noun-phrase
                   (article the) (noun student))))
   (prep-phrase (prep in)
                (noun
                 (simple-noun-phrase
                  (article the) (noun class))
                 (prep-phrase (prep with)
                              (simple-noun-phrase
                               (article the) (noun cat)))))))
