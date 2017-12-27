(define (sum-sqr x y)
  (define (sqr x) (* x x))  ; square as internal definition... 
  (+ (sqr x) (sqr y)))      ; ... BiwaScheme has no sqr function.

(define (two-largest a b c)
  (cond ((> (and a b) c) (sum-sqr a b)) ; a simplified "((and (> a c) (> b c))" 
        ((> (and b c) a) (sum-sqr b c))
        ((> (and c a) b) (sum-sqr c a))))
