(rule (big-shot ?person ?division)
      (and (job ?person (?division . ?))
           (not (and (supervisor ?person ?super)
                     (job ?super (?division . ?))))))
