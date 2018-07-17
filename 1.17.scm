;; sicp 1.17

(define (multiply a b)
  (if (= b 0) 0
  (+ a (multiply a (- b 1)))))

(define (iter-multiply a b)
  (cond ((= b 0) 0)
        ((= b 1) a)
        ((even? b)
              (double (iter-multiply a
                      (half b))))
        (else (+ a (iter-multiply a
                                  (- b 1))))))
