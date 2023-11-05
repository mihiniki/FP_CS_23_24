#lang racket

(define (accumulate-rec f acc start end transform next)
  (if (> start end)
      acc
      (f (transform start) (accumulate-rec f acc (next start) end transform next))
      )
  )

; 1 + 2 + 3 + ... + 100
(= (accumulate-rec + 0 1 100 identity add1) 5050)

; 1 - (2 - (3 - (4 - 5)))
(= (accumulate-rec - 0 1 5 identity add1) 3)

; 1 * 2 * 3 * ... * 10
(= (accumulate-rec * 1 1 10 identity add1) 3628800)

; 1 * 3 * 5 * ... * 10
(= (accumulate-rec * 1 1 15 identity (curry + 2)) 2027025)

; 1^2 + 3^2 + 5^2 + ... + 100^2
(= (accumulate-rec + 0 1 100 (λ (x) (expt x 2)) add1) 338350)
