#lang scheme
#| Exercise 1.30
|#

#|
Main idea for a: Increment a by the rule given in 'next' and re-assign it to a

Main idea for result: Add the term in a to the result and re-assign it to result
|#

(define (sum term a next b)
  (define (iter a result)
    (if (> a b)
        result
        (iter (next a) (+ result (term a)))
    )
   )
;; result should first be initialised to zero 
  (iter a 0)
)