#lang racket
(require math/number-theory)
#|
Define a procedure that returns
the sum of all the divisors of a number.
Assume correct input.
If the number is negative return 0.
|#

(define (sum-divs n)
  (define (helper d res)
    (cond
      [(> d n) res]
      [(divides? d n) (helper (add1 d) (+ res d))]
      [else (helper (add1 d) res)]
      )
    )
  (if (negative? n)
      0
      (helper 1 0)
      )
  
)

(= (sum-divs 0) 0)
(= (sum-divs 1) 1)
(= (sum-divs 6) 12) ; 1 + 2 + 3 + 6
(= (sum-divs -6) 0)
(= (sum-divs 12345) 19776)
 