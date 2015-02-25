(rule (can-replace ?person1 ?person2)
      (and
       (not (same? ?person1 ?person2))
       (job ?person1 ?job1)
       (job ?person2 ?job2)
       (or (same? ?job1 ?job2)
           (and (job ?person3 ?job3)
                (can-do-job ?job1 ?job3)
                (can-do-job ?job3 ?job1)))))
      
(can-replace ?person (Cy D. Fect))

(and (can-replace ?person1 ?person2)

     (salary ?person1 ?salary1)
     (salary ?person2 ?salary2)
     (lisp-value < salary1 salary2))
