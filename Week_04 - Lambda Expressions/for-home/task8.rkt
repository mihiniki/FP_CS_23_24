#lang racket

(require math/number-theory)

#|
Using `accumulate` define a procedure that:

- for a given `n` calculates the expression `2^3 + 5^3 + 8^3 + ... + n^3`;
- checks whether a number in an interval passes a predicate `p?`;
- calculates the factorial of a number;
- checks whether a number is prime.
|#

(define (accumulate f acc start end transform next)
  (if (> start end)
      acc
      (accumulate f (f (transform start) acc) (next start) end transform next)
   )
  )

(define (any? start end p?)
  (accumulate (λ (x acc) (or x acc)) #f start end p? add1)
  )

(define (cubed-interval-till n)
  (accumulate + 0 2 n (λ (x) (expt x 3)) (curry + 3))
  )

(define (fact-accum n)
  (accumulate * 1 1 n identity add1)
  )

(define (prime-accum? n)
  (and (> n 1) (accumulate (λ (d acc) (and (not (divides? d n)) acc)) #t 2 (sub1 n) identity add1))
  )

(equal? (any? 1001 1500 (λ (x) (< x 1000))) #f)
(equal? (any? 1 100 odd?) #t)

(= (cubed-interval-till 11) 1976)
(= (cubed-interval-till 15) 4720)

(= (fact-accum 5) 120)
(= (fact-accum 8) 40320)

(equal? (prime-accum? 1) #f)
(equal? (prime-accum? 2) #t)
(equal? (prime-accum? 3) #t)
(equal? (prime-accum? 6) #f)
(equal? (prime-accum? 42) #f)
(equal? (prime-accum? 61) #t)
