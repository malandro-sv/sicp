;; 1.18.scm iterative, logarithmic procedure
;; to compute a multiplication by repeated addition.

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
