(load "../misc/auxiliars.scm")                                     

(define (ratio ohm percent)
    (* ohm (/ percent 100)))

(define (tolerance ohm percent)
    (define (bound operator)
        (operator ohm (ratio ohm percent)))  
            
    (list (bound -)
          (bound +)))
              
;; proof of concept: total resistance
;; for two items only:
(define (pair-allel r1 r2) 
    (/ 1 (+ (/ 1 r1) 
            (/ 1 r2))))

;; for a list of resitors:
(define (parallel-denominator Rs) 
  (if (null? Rs) 0
      (+ (/ 1 (car Rs))
         (parallel-denominator (cdr Rs)))))

(define (total-parallel Rs) 
  (/ 1 (parallel-denominator Rs)))
                     
(define (combined-paralls Rs tolers)
  (tolerance (total-parallel Rs) 
             (list-average tolers)))
