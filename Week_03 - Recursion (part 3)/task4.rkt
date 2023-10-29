#lang racket

#|
Define a recursive procedure (sum-numbers start finish) that
returns the sum of all numbers from the interval [start, finish]
whose digits are ordered in decreasing order.
|#

(define (decreasing? n)
  (cond
    [(< n 10) #t]
    [(< (remainder (quotient n 10) 10) (remainder n 10) ) #f]
    [else (decreasing? (quotient n 10))]
    )
  )

(define (sum-numbers start finish)
  (define (helper real-start real-finish)
    (cond
      [(> real-start real-finish) 0]
      [(decreasing? real-start) (+ real-start (helper (add1 real-start) real-finish))]
      [else (helper (add1 real-start) real-finish)]
      )
    )
  (helper (min start finish) (max start finish))
  )

(= (sum-numbers 1 9) 45)
(= (sum-numbers 199 203) 200)
(= (sum-numbers 219 225) 663)
(= (sum-numbers 225 219) 663)
