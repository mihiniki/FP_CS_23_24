#lang racket
(require math/number-theory)
#|
Define the procedure that accepts
a whole number - n, and a real number (representing radians) - x,
and returns the nth partial sum of sin(x).
|#

(define (my-sin n x)
  (if (negative? n)
      0
      (+ (my-sin (sub1 n) x) (* (expt -1 n) (/ (expt x (add1 (* 2 n))) (factorial (add1 (* 2 n))))))
      )
  )

(my-sin 100 1.570796)  ; 90 degrees => 0.9999999999999465
(= (my-sin 100 0.5235988) 0.5000000211324931) ; 30 degrees => 0.5000000211324931
