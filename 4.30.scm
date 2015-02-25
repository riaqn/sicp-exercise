a. I think it's not relavant to things we discussing here.
b.(p1 1) returns (1 2)
(p2 1) returns (1), since (set! x (cons x '(2))) is never called so remains a thunk.


after the modification, both return (1 2)

c.why not?

d.I 'd love the approach in the text. It's more clear.
