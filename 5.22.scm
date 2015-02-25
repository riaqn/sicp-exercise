append
(test (op null?) (reg x))
(branch (label is-null))
(save continue)
(save x)
(assign x (op cdr) (reg x))
(assign continue (label after-sub-1))
(goto append)
after-sub-1
(restore x)
(assign x (op car) (reg x))
(assign val (op cons) (reg x) (reg val))
(resotre continue)
(goto (label (append-end)))
is-null
(assign val (reg y))
append-end
(goto (reg continue))

append!
(save continue)
(assign continue (label after-sub))
(goto (label last-pair))
after-sub
(perform (op set-cdr!) (reg val) (reg y))
(assign val (reg x))
(resotre continue)
(goto (reg continue))

last-pair
(save x)
(assign x (op cdr) (reg x))
(test (op null?) (reg x))
(branch (label is-null))
(restore dummy)
(goto (label last-pair)) ;never return
is-null
(restore val)
(goto (reg continue))
