#lang racket

#|
Define a procedure that finds the maximum digit in a number.
|#

(define (find-max n)
  (define (helper res leftover)
    (cond
      [(zero? leftover) res]
      [(> (remainder leftover 10) res) (helper (remainder leftover 10) (quotient leftover 10))]
      [else (helper res (quotient leftover 10))]
      )
    )
  (helper 0 n)
  )

(= (find-max 55345) 5)
(= (find-max 14752) 7)
(= (find-max 329450) 9)
(= (find-max 9521) 9)
