#lang racket

; Define procedures that in linear time transform
; a number into a list of its digits and vice versa.

(define (num-to-xs n)
 (define (helper ress copy-n)
   (if (zero? copy-n)
       ress
       (helper (cons (remainder copy-n 10) ress) (quotient copy-n 10))
       )
   )
  (helper '() n)
  )


(define (xs-to-num xs)
  (define (helper xs)
    (if (null? xs)
      0
      (+ (car xs) (* 10 (helper (cdr xs))))
      )  
  )
  (helper (reverse xs))
  )

;(num-to-xs 123)
(equal? (num-to-xs 123) '(1 2 3))
(equal? (num-to-xs 123456789) '(1 2 3 4 5 6 7 8 9))

(xs-to-num '(1 2 3))
(= (xs-to-num '(1 2 3 4 5 6 7 8 9)) 123456789)



