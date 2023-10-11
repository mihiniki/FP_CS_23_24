#lang racket

(define (fact-rec n)
  (cond
    [(< n 0) (error "n must be non-negative")]
    [(zero? n) 1]
    [else (* n (fact-rec (sub1 n)))]
    )
  )

(define (fact-iter n)
  (define (helper copy-n res)
   (if (zero? copy-n)
       res
       (helper (sub1 copy-n) (* res copy-n))
       ) 
  )
  (if (negative? n)
      (error "n must be non-negative")
      (helper n 1)
  )
  )

(= (fact-rec 0) 1)
(= (fact-rec 1) 1)
(= (fact-rec 11) 39916800)
;(fact-rec -1)

(= (fact-iter 0) 1)
(= (fact-iter 1) 1)
(= (fact-iter 11) 39916800)

