#lang racket

#| Define a recursive procedure and an iterative
 procedure for calculating the number at index i
in the Fibonacci sequence (0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...).

Implementation detail:

Add a test case with a negative number!
|#

(define (fib-rec n)
  (cond
   [(negative? n) (error "n has to be non-negative")]
   [(zero? n) 0]
   [(= n 1) 1]
   [else (+ (fib-rec (sub1 n)) (fib-rec (- n 2)))]
   )
)

(define (fib-iter n)
  (define (helper n0 n1 leftover)
    (cond
      [(zero? leftover) n0]
      [(= leftover 1) n1]
      [else (helper n1 (+ n0 n1) (sub1 leftover))]
      )
    )
  (helper 0 1 n)
) 

;(fib-rec -1)
(= (fib-rec 11) 89)
(fib-rec 5)

(fib-iter 50)

(= (fib-iter 11) 89)

