#lang racket

#|
Define a recursive
and an iterative procedure for calculating "x" to the power of "n".
|#

(define (pow-rec x n)
  (if(zero? n)
     1
     (* (pow-rec x (sub1 n)) x))
)

(define (pow-iter x n)
 (define (helper power result)
   (if (zero? power)
       result
       (helper (sub1 power) (* result x)))
   )
  (helper n 1)
)

(= (pow-rec 2 5) 32)
(= (pow-rec 15 3) 3375)

(= (pow-iter 2 5) 32)
(= (pow-iter 15 3) 3375)
