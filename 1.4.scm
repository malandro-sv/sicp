(define (a-plus-abs-b a b)
  ((if (> b 0) + -) a b))

; the sum of a and the absolute value of b
; if "b > 0" operate "a + b"
; otherwise, operate "a - (-b)"
