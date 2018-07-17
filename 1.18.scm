;; 1.18
;; Multiplication by repeated addition:
;; 20 * 6 = ((+ 20 20) (+ 20 20) (+ 20 20))
;; generates a logarithmic -more time/space efficient-
;; computation.

(define (multiply a b)
  (cond ((= a 0) 0)
        ((= b 0) 0)
        ((= a 1) b)
        ((= b 1) a)
        (else (iterate a b 0))))

(define (iterate a b result)
  (cond ((= a 1) b)
        ((= b 0) result)
        ((even? b) (iterate (+ a a)
                            (/ b 2)
                             result))
        (else (iterate a
                       (- b 1)
                       (+ a result)))))
