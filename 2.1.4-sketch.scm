(load "../misc/auxiliars.scm") 
    
(define (ratio ohm percent)
    (* ohm (/ percent 100)))

;; I initially called this, "tolerance":
(define (make-interval ohm percent)
    (define (bound operator)
        (operator ohm (ratio ohm percent)))  
    
    (cons (bound -)
          (bound +))) 
                     
;; total rsistance for two items only: 
(define (pair-allel r1 r2) 
    (/ 1 (+ (/ 1 r1) 
            (/ 1 r2)))) 
 
;; total resistance value
;; for a list of resitors: 
(define (parallel-denominator Rs) 
  (if (null? Rs) 0 
      (+ (/ 1 (car Rs)) 
         (parallel-denominator (cdr Rs))))) 
 
(define (total-parallel Rs) 
  (/ 1 (parallel-denominator Rs))) 
                  
(define (combined-paralls Rs tolers) 
  (make-interval (total-parallel Rs) 
                 (list-average tolers))) 
 
;; (define (make-interval a b) (cons a b)) 
(define (upper-bound interval) 
  (cdr interval)) 
 
(define (lower-bound interval) 
  (car interval)) 
 
 ;; make-interval thru message-passing.
(define (bound interval) 
  (define (selector option) 
    (cond ((eq? option 'lower)  (car interval)) 
          ((eq?  option 'upper) (cdr interval)) 
          (else (display "invalid selector")))) 
  selector) 
            
