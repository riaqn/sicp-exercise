First it check in the data base for (supervisor ?staff-person ?boss), which return the answer.
next, it call the (outranked-by ?middle-manager ?boss), which extend a frame in which ?staff-person is bound to ?middle-manager, and ?boss is bound to ?boss, which is ?who.
in the new (outranked-by), the (and) clause will continued to be evaluated, which will continue the (outranked-by) call. We 're now at a infinite loop now.
