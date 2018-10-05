#|

Ex 1.29, implementation of simpson's rule

|#

#lang racket

(define (cube x) (* x x x))
(define (inc j) (+ j 1))

(define (simpson-rule f a b n)

  ;; Use of the function sum that helps with summation as described in the book

  (define (sum term a next b)
    (if (> a b)
        0
        (+ (term a) (sum term (next a) next b)))
    )

  ;; Definition of h as given in the book
  
  (define h (/ (- b a) n))

  #| Definition of the coefficient of each of the y_i terms. Except for i = 0 or n, note that if i is odd, the coefficient is 4. If i is even, the coefficient is 2.
 The following definition is based on this piecewise definition. |#
 

  (define (multiple m)
    (cond ((or (= m 0) (= m n)) 1)
          ((odd? m) 4)
          (else 2)))
  
  ;; Definition of each y_i term
  
  (define (y-k k)
    (* (multiple k) (f (+ a (* k h))))
    )

  ;; Actual calculation begins here

  (* (sum y-k 0 inc n) (/ h 3))

)

;; Should return 0.25 (1/4)
(simpson-rule cube 0 1 200)