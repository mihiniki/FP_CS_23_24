#lang racket

(define (upper-bound f y)
  (λ (x) (max (f x) y))
  )

(= ((upper-bound (lambda (x) (* x 2)) 100) 50) 100)
(= ((upper-bound (lambda (x) (* x 2)) 100.236) 500.002) 1000.004)
(= ((upper-bound identity 1.001) 1.001) 1.001)