;;http://community.schemewiki.org/?sicp-ex-4.10
;; 
 ;; Say, there's another syntax which places the function name at the end of a list: 
 ;;   (1 2 3 +) 
 ;; if we change related functions such as tagged-list?, if?, eval/apply won't be affected. 
  
 (define (last-element lst) 
     (if (null? (cdr lst)) 
         (car lst) 
         (last-element (cdr lst)))) 
  
 (define (tagged-list? exp sym) 
     (if (pair? exp) 
         (let ((last (last-element exp))) 
             (eq? last sym)) 
         #f)) 
  
 (define (if? exp) (tagged-list? exp 'if)) 
  
 (define (if-predicate exp) (car exp)) 
  
 (define (if-consequent exp) (cadr exp)) 
  
 (define (if-alternative exp) 
     (if (= (length exp) 4) 
         (caddr exp) 
         'false)) 
  
 ; ... 
