#lang racket

; Define a procedure that removes
; the first match of an element by going from left to right.

(define (remove-first-proc x xs)
  (remove x xs)
  )

(define (remove-first-no-proc x xs)
 (define (helper ress xs-copy)
   (cond
     [(null? xs-copy) (reverse ress)]
     [(equal? x (car xs-copy)) (append (reverse ress)(cdr xs-copy))]
     [else (helper (cons (car xs-copy) ress) (cdr xs-copy))]
     )
   )
  (helper '() xs)
  )

;1 '(2 5 1 6)
;1 '(5 1 6)
;1 '(1 6)
;'(6)


; using a predefined procedure
(equal? (remove-first-proc 1 '(1 1 1 2)) '(1 1 2))
(equal? (remove-first-proc 1 '(2 5 6)) '(2 5 6))
(equal? (remove-first-proc 1 '(1)) '())
(equal? (remove-first-proc 1 '(2 1)) '(2))
(equal? (remove-first-proc "RNN" '("CNN" "RNN" "GAN" "RNN")) '("CNN" "GAN" "RNN"))

; without using a predefined procedure
(equal? (remove-first-no-proc 1 '(1 1 1 2)) '(1 1 2))
(remove-first-no-proc 1 '(2 5 6))
(equal? (remove-first-no-proc 1 '(1)) '())
(equal? (remove-first-no-proc 1 '(2 1)) '(2))
(equal? (remove-first-no-proc "RNN" '("CNN" "RNN" "GAN" "RNN")) '("CNN" "GAN" "RNN"))
