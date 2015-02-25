;a
count-leaves
(test (op null?) (reg tree))
(branch (label is-null))
(test (op pair?) (reg tree))
(branch (label is-pair))
(assign val (const 1))
(goto (label count-leaves-end))
is-null
(assign val (const 0))
(goto (label count-leaves-end))
is-pair
(save continue)
(save tree)
(assign tree (op car) (reg tree))
(assign continue (label after-sub-1))
(goto (label count-leaves))
after-sub-1
(restore tree)
(save val)
(assign tree (op cdr) (reg tree))
(assign continue (label after-sub-2))
(goto (label count-leaves))
after-sub-2
(restore val2)
(assign val (op +) (reg val) (reg val2))
(restore continue)
count-leaves-end
(goto (reg continue))

;b
count-leaves
(assign n (const 0))
count-iter
(test (op null?) (reg tree))
(branch (label is-null))
(test (op pair?) (reg tree))
(branch (label is-pair))
(assign val (op +) (reg n) (const 1))
(goto (label count-iter-end))
is-null
(assign val (reg n))
is-pair
(save continue)
(save tree)
(assign tree (op car) (reg tree))
(assign continue (label after-sub-1))
(goto (label count-iter))
after-sub-1
(restore tree)
(assign tree (op cdr) (reg tree))
(assign n (reg val))
(assign continue (label after-sub-2))
(goto (label count-iter))
after-sub-2
(restore continue)
count-iter-end
(goto (reg continue))
