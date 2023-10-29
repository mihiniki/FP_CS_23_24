#lang racket

#|
A digital root is the recursive sum of all the digits in a number.
Given n, take the sum of the digits of n.
If that value has more than one digit,
continue reducing in this way until a single-digit number is produced.
This is only applicable to the natural numbers.
|#

(define (sum-digits n)
  (if (zero? n)
      0
      (+ (remainder n 10) (sum-digits (quotient n 10)))
      )
  )

(define (digital-root n)
  (if (< n 10)
      n
      (digital-root (sum-digits n))
      )
  )

(= (digital-root 16) 7)
; => 1 + 6
; => 7
(= (digital-root 942) 6)
; => 9 + 4 + 2
; => 15
; => 1 + 5
; => 6
(= (digital-root 132189) 6)
(= (digital-root 493193) 2)
