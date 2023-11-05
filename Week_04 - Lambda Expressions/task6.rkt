#lang racket

#|
Using `accumulate` define a procedure that:

- checks whether all numbers in an interval pass a predicate `p?`;
- returns the local minimum for the unary function `f` in the interval `[start, end]`.
|#

(define (accumulate f acc start end transform next)
  (if (> start end)
      acc
      (accumulate f (f (transform start) acc) (next start) end transform next)
   )
  )

(define (all? start end p?)
  (accumulate (λ (x acc) (and x acc)) #t (min start end) (max start end) p? add1)
  )

(define (argmin f start end)
  (accumulate (λ (x acc) (if (< (f x) (f acc)) x acc)) start (min start end) (max start end) identity add1)
  )

(equal? (all? 100 999 (λ (x) (< x 1000))) #t)
(equal? (all? 1 100 odd?) #f)
(equal? (all? 1042 524 odd?) #f)

(define (mod7 x) (remainder x 7))
(= (argmin mod7 45 50) 49)
