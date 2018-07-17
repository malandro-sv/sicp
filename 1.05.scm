(define (p) (p))

(define (test x y)
  (if (= x 0)
      0
      y))

; >>> normal-order evaluation would not evaluate operands
; until their values are needed; PLUS, as per 1.5: 

; " Assume that the evaluation rule for the special form
; <<if>> is the same whether the interpreter is using 
; normal or applicative order: The predicate expression is evaluated first,
; and the result determines whether to evaluate the consequent or the alternative expression."

; so, (test 0 (p))
; would first execute the operand expressions: 

;   ...
;   (if (= x 0) ; #t
;       0
;       ...

; that satisfies (= x 0)
; returning x. 

; >>> applicative-order evaluation [interpreter first evaluates the operator
; (elements of the combination as operator/s) and it'll apply it to
; the arguments —the values of the combination, operands):

; so, for (p):

; (p)
; ((p) (p))
; ((p) ((p) (p)))
; ((p) ((p ((p) (p)))))
; ... ... ... ... ... ... 
; ... ... ... ... ... ... ... ... 

; this creates a loop in (test 0 (p)) as it will first
; evaluate the operator and operands of (p) 
; before the full procedure (test x y) is even executed.
