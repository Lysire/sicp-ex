#| Implementation of cube-root based on iteration.
Almost the same as the sqrt-iter program given in SICP, except here the guess is improved through the formula ((x / y^2)+ 2y)/3.
The 'over-squared' function was created to easily implement the (x / y^2) bit |#

#lang racket
(define (square x) (* x x))

(define (cube x) (* x x x))

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
        (curt-iter (improve guess x) x)
    )
)

(define (curt x)
    (curt-iter 1.0 x)
)

;; Test, should return about 1.259
(curt 2)