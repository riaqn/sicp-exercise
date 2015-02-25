http://community.schemewiki.org/?sicp-ex-5.10  
 ;; as an example - instead of (assign x (op +) (reg a) (reg b)) I want 
 ;; the syntax: (assign x (apply + (reg a) (reg b))) 
  
 (define (operation-exp? exp) 
   (tagged-list? exp 'apply)) 
 (define (operation-exp-op exp) 
   (cadr exp)) 
 (define (operation-exp-operands exp) 
   (cddr exp)) 
