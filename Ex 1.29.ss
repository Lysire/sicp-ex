#|

Ex 1.29, implementation of simpson's rule

|#

(define (cube x) (* x x x))

(define (simpson-rule f a b n)

	(define (sum term a next b)
		(if (> a b)
			0
			(+ (term a)
				(sum term (next a) next b)
			)
		)
	)

	(define h (/ (- b a) n))
	
	(define (multiple m)
		(cond ((or (= m 0) (= m n)) 1)
			((odd? m) 4)
			(else 2)
		)
	)
	
	(define (y-k k)
		(* (multiple k) (f (+ a (* k h))))
	)

	(define (inc j)
		(+ j 1)
	)
	
	(* (sum y-k 0 inc n)
		(/ h 3)
	)
)

(simpson-rule cube 0 1 200)