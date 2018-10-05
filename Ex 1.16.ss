#lang racket

#|
Main idea: While n is still even, b gets squared and gets assigned to b. (b^2 -> b)
           If n is odd, assign a*b to a and decrement n by 1 to make n even and carry with the loop
|#
(define (fast-expt-iter b n)
  (define (iter a b n)
    (cond ((= n 0) a)
          ((even? n) (iter a (square b) (/ n 2)))
          (else (iter (* a b) b (- n 1)))))
  (iter 1 b n))

(define (square b) (* b b))