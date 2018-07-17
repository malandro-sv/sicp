;; 1.17                                                                                                     
;; Multiplication by repeated addition.
;; generates a recursive computation.

;; Linear, recursive example,
;; (May be improved as well:
(define (example-multiply a b)
  (if (= b 0) 0
  (+ a (example-multiply a (- b 1)))))

;; Improved, linear-recursive procedure;
;; Includes multiply-by-0-or-by-1 cases,
;; to avoid recursing unnecessarily: 
(define (multiply a b)
  (cond ((= a 1) b)
        ((= b 1) a)
        ((= b 0) 0)
        (else (mult a b))))

(define (mult a b)
  (if (= b 0) 0
      (+ a (mult a
                 (- b 1)))))

;; this is the logarithmic,
;; iterative procedure:
(define (iter-multiply a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b)
              (double (iter-multiply a
                      (half b))))
        (else (+ a (iter-multiply a
                                  (- b 1))))))
