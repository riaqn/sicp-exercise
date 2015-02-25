(0, 1) change to (1, 0)
First, 0 change to 1
the add-action-procedure is called, and output will be set to 1, after and-gate-delay
secondly, 1 change to 1
the add-action-procedure is called, and output will be set to 0, after and-gate-delay

now, there is two procedures waiting to be executed, in the same time segment after and-gate-delay, of which the former added one will set output to 1, the later added one, will set output to 0.

if we first run the later added one, then the former added one, what happed? :D
yes, the wrong output 1 will take effect.
