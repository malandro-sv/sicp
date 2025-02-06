;; SICP 2.3: Implement a representation for rectangles in a plane.
;; GistID:82f97618ae1a1a4145c357a73da30268   

;; I've opted for representing rectangles made out of
;; complete line segments.

(define (average a b) (/ (+ a b ) 2))

(define (make-point x y) (cons x y)) 
(define (x-point pair) (car pair))
(define (y-point pair) (cdr pair))

(define (make-segment starting-point ending-point)
	(cons starting-point ending-point))

(define (start-segment s) (car s))
(define (end-segment s) (cdr s))

(define (mid-point line)
	(make-point (average (x-point (start-segment line)
	                     (x-point (end-segment line)))
	            (average (y-point (start-segment line))
	                     (y-point (end-segment line))))))

(define (make-rectangle base height)	                              
	(merge-angles (start-angle base height)
	              (end-angle base height)))

(define (merge-angles straight1 straight2)
	(cons straight1 straight2))

(define (merge-segments segment1 segment2)
	(cons segment1 segment2))

(define (start-angle base height)
	;; first angle begins (a.k.a., the "L"):
	(merge-segments (make-segment (make-point 0 0)
	                              (make-point 0 base))
			(make-segment (make-point 0 0)
				      (make-point 0 height))))

(define (end-angle base height)
	(merge-segments (make-segment (make-point 0 base)
	                              (make-point base height))
			(make-segment (make-point 0 height)
				      (make-point base height))))
              
define (perimeter r)
	(* 2 (+ (rec-base r)
	        (rec-height r))))
  
(define (area r)
	(* (rec-base r)
	   (rec-height r)))
