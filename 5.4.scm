(controller
 expt
 (test (op =) (reg n) (const 0))
 (branch (label expt-done))
 (save n)
 (assign n (op -) (reg n) (const 1))
 (save continue)
 (assign continue (label after-expt))
 (goto expt)
 after-expt
 (restore continue)
 (restone n)
 (assign val (op *) (reg b) (reg val))
 (goto (reg continue))
 expt-done
 (assign val (const 1))
 (goto (reg continue)))

(controller
 expt
 (test (op =) (reg counter) (const 0))
 (branch (label expt-iter-done))
 (assign counter (op -) (reg counter) (const 1))
 (assign product (op *) (reg b) (reg product))
 (goto expt)
 expt-iter-done
 (assign val product))
