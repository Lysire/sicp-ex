;;; My solution to Ex 1.8 of SICP, implementation of cube root

(define (square x) (* x x))

(define (cube x (* x x x)))

(define (over-squared x y)
    (/ x (square y))
)

(define (improve guess x)
    (/ (+ (over-squared x guess) 
    (* 2 guess)) 3)
)

(define (good-enough? guess x)
    (< (abs (- (cube guess) x)) 0.0001)
)

(define (curt-iter guess x)
    (if (good-enough? guess x)
        guess
        (curt-iter (improve guess) x)
    )
)

(define (curt x)
    curt-iter 1.0
)