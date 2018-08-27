(define (square x) (* x x))
(define (cube x) (* x x x))

(define (divides? a b)
  (= (remainder b a) 0))

(define (smallest-divisor n)
  (find-divisor n 2)) 

(define (find-divisor n test-divisor)
  (cond ((> (square test-divisor) n) n)
	((divides? test-divisor n) test-divisor)
	(else (find-divisor n (next test-divisor))))) 

(define (next number)
  (if (even? number) (inc number)
      (inc-odd number)))
    
(define (list-sum term lst)
  (if (null? lst) 0
      (+ (term (car lst))
	 (list-sum term (cdr lst)))))

(define (list-average lst)
  (/ (list-sum + lst)
     (length lst)))

(define (sum term a next b)
  (if (> a b) 0
      (+ (term a)
	 (sum term (next a) next b))))

(define (gauss n)
    (/ (* n (+ n 1))
       2))
