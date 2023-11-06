#lang racket

; Define a procedure that returns the smallest element of a list.

(define (get-smallest-rec xs)
 (define (helper res copy-xs)
   (cond
     [(null? copy-xs) res]
     [(< (car copy-xs) res) (helper (car copy-xs) (cdr copy-xs))]
     [else (helper res (cdr copy-xs))]
     )
   )
  (helper (car xs) xs)
  )

(define (get-smallest-proc xs)
  (apply min xs)
  )

(define (get-smallest-fold-proc xs)
  (foldl min (car xs) xs)
  )

(define (get-smallest-fold-no-proc xs)
  (foldl (λ (x y) (if (< x y) x y)) (car xs) xs)
  )

;acc=1
;leftover='(2 5)


; using a recursive procedure
(= (get-smallest-rec '(1 2 5)) 1)
(= (get-smallest-rec '(2 1 5)) 1)
(= (get-smallest-rec '(2 1 -1 5)) -1)

; with a predefined procedure
(= (get-smallest-proc '(1 2 5)) 1)
(= (get-smallest-proc '(2 1 5)) 1)
(= (get-smallest-proc '(2 1 -1 5)) -1)

; using a folding with a predefined procedure
(= (get-smallest-fold-proc '(1 2 5)) 1)
(= (get-smallest-fold-proc '(2 1 5)) 1)
(= (get-smallest-fold-proc '(2 1 -1 5)) -1)

; using a folding without a predefined procedure
(= (get-smallest-fold-no-proc '(1 2 5)) 1)
(= (get-smallest-fold-no-proc '(2 1 5)) 1)
(= (get-smallest-fold-no-proc '(2 1 -1 5)) -1)
