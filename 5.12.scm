        * a list of all instructions, with duplicates removed, sorted
          by instruction type (`assign', `goto', and so on);

        * a list (without duplicates) of the registers used to hold
          entry points (these are the registers referenced by `goto'
          instructions);

        * a list (without duplicates) of the registers that are `save'd
          or `restore'd;

        * for each register, a list (without duplicates) of the sources
          from which it is assigned (for example, the sources for
          register `val' in the factorial machine of *Note Figure
          5-11:: are `(const 1)' and `((op *) (reg n) (reg val))').

;store all instructions used, as example
(define (set-add! set item)
  (define (iter s)
    (if (null? s)
        (list item)
        (if (eq? item (car set))
            set
            (begin
              (iter (cdr set))
              set))))
  (iter set))

(define (make-execution-produre inst labels machine
                                pc flag stack ops)
  (....)
  ((machine 'set-stat) (set-add! (machine 'get-stat) (car inst))))

  (define (make-new-machine)
    (let (...
          (stat '()))
  ;just used to store extra statistics
  (define (set-stat! s)
    (set! stat s))

  (define (dispatch message)
    (...)
    ((eq? message 'set-stat!) set-stat!)
    ((eq? message 'get-stat) stat)
    (...)))
