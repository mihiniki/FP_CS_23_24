#lang racket

#|
Define a predicate that
accepts two non-negative inputs - x and y,
and checks whether x is a sub-number of y.
|#

(define (count-digits n)
  (if (< n 10)
      1
      (add1 (count-digits (quotient n 10)))
      )
  )

(define (sub-num? x y)
  (cond
    [(< (count-digits y) (count-digits x)) #f]
    [(= x (remainder y (expt 10 (count-digits x)))) #t]
    [else (sub-num? x (quotient y 10))]
  )
 )

(equal? (sub-num? 123 5123783) #t)
(equal? (sub-num? 0 0) #t)
(equal? (sub-num? 10 101) #t)
(equal? (sub-num? 101 101) #t)
(equal? (sub-num? 10 0) #f)
(equal? (sub-num? 1253 5123783) #f)
(equal? (sub-num? 12 0) #f)
