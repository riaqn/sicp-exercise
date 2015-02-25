e.g.
In a recording system, each record contain pointers to some related
records. When two process access two records A and B, which are
related, the two process may obtain their mutex respectively, then
they try to access the related record, which is A for process 2, B for
process 1. This will lead to a deadlock.
