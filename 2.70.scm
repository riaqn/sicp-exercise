(load "2.69.scm")

(define tree (generate-huffman-tree '((A 2)
                         (GET 2)
                         (SHA 3)
                         (WAH 1)
                         (BOOM 1)
                         (JOB 2)
                         (NA 16)
                         (YIP 9))))

(define message '(get a job
                      sha na na na na na na na na
                      get a job
                      sha na na na na na na na na
                      wah yip yip yip yip yip yip yip yip yip
                      sha boom))

(length message)

(define bits (encode message tree))

(length bits)

(decode bits tree)

;if we use a fixed-length code, and with 8 possible words, we need 3
;bits per word, that's 3*36 = 108 bits. we saved (108-84)/108=22%
