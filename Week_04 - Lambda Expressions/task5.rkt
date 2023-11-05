#lang racket

; (f (transform start) (f (transform (next start)) ... (f (transform start) acc)))

(define (accumulate f acc start end transform next)
  (if (> start end)
      acc
      (accumulate f (f (transform start) acc) (next start) end transform next)
      )
  )

; 1 + 2 + 3 + ... + 100
(= (accumulate (λ (x y) (+ x y)) 0 1 100 identity add1) 5050)
(= (accumulate + 0 1 100 identity add1) 5050)
; 1 - (2 - (3 - (4 - 5)))
(= (accumulate - 0 1 5 identity add1) 3)

; 1 * 2 * 3 * ... * 10
(= (accumulate * 1 1 10 identity add1) 3628800)

; 1 * 3 * 5 * ... * 10
(= (accumulate * 1 1 10 identity (λ (y) (+ y 2))) 945)
(= (accumulate * 1 1 10 identity (curry + 2)) 945)

; 1^2 + 3^2 + 5^2 + ... + 100^2
(= (accumulate + 0 1 100 (λ (x) (expt x 2)) (curry + 2)) 166650)
