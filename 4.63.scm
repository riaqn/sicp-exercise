(rule (grandson ?grand ?son)
      (and (son ?grand ?father)
           (son ?father ?son)))

(rule (son ?father ?son)
      (and (wife ?father ?wife)
           (son ?wife ?son)))
