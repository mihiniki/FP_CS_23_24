# Task 1

Define a recursive procedure and an iterative procedure for calculating the number at index i in the Fibonacci sequence (0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, ...).

Implementation detail: Add a test case with a negative number!

Test cases:

```scheme
(= (fib-rec 11) 89)

(= (fib-iter 11) 89)
```

# Task 2

A number is a palindrome if and only if it is the same number from right to left as well as from left to right. Define a predicate that checks whether a non-negative number is a palindrome.

Test cases:

```scheme
(equal? (palindrome? 1) #t)
(equal? (palindrome? 6) #t)
(equal? (palindrome? 1010) #f)
(equal? (palindrome? 505) #t)
(equal? (palindrome? 123321) #t)
(equal? (palindrome? 654) #f)
(equal? (palindrome? 121) #t)
(equal? (palindrome? 12) #f)
(equal? (palindrome? 120) #f)
(equal? (palindrome? 12321) #t)
(equal? (palindrome? 1221) #t)
```

# Task 3

Define a linearly recursive procedure for calculating the sum of the digits of a positive number. Assume correct input.

Test cases:

```scheme
(= (sum-digits-rec 123) 6)
(= (sum-digits-rec 12345) 15)
```

# Task 4

Define a recursive and an iterative procedure for calculating `x` to the power of `n`.

Test cases:

```scheme
(= (pow-rec 2 5) 32)
(= (pow-rec 15 3) 3375)

(= (pow-iter 2 5) 32)
(= (pow-iter 15 3) 3375)
```

# Task 5

A number is prime if and only if it is natural, greater than `1` and its only divisors are `1` and itself. Define a predicate that checks whether a number is prime.

Test cases:

```scheme
(equal? (num-prime? 1) #f)
(equal? (num-prime? 2) #t)
(equal? (num-prime? 3) #t)
(equal? (num-prime? 6) #f)
(equal? (num-prime? 42) #f)
(equal? (num-prime? 61) #t)
```

# Task 6

Define a procedure that returns the sum of all the divisors of a number. Assume correct input. If the number is negative return `0`.

Test cases:

```scheme
(= (sum-divs 0) 0)
(= (sum-divs 1) 1)
(= (sum-divs 6) 12) ; 1 + 2 + 3 + 6
(= (sum-divs -6) 0)
(= (sum-divs 12345) 19776)
```

# Task 7

A number is perfect if and only if it is natural and equal to the sum of its divisors, excluding the number itself. Define a predicate that checks whether a number is perfect. Assume correct input.

Test cases:

```scheme
(equal? (perfect? 6) #t)
(equal? (perfect? 33550336) #t)
(equal? (perfect? 495) #f)
(equal? (perfect? 1) #f)
```

# Task 8

Define a predicate `(inc-digits? n)` that checks whether the digits of the non-negative `n` are ordered in an ascending order.

Test cases:

```scheme
(equal? (inc-digits? 1244) #t)
(equal? (inc-digits? 12443) #f)
```

# For home

## Task 1

Define two procedures that return the sum of the cubes of two numbers:

- using a built-in procedure;
- **without** using built-in procedures.

Test cases:

    (= (sum-cubes-pow 5 1) 126)
    (= (sum-cubes-pow 10 50) 126000)

    (= (sum-cubes-no-pow 5 1) 126)
    (= (sum-cubes-no-pow 10 50) 126000)

## Task 2

Define a procedure that returns the average of the sum of the squares of two numbers.

Test cases:

    (= (sq-avg 5 0) 12.5)
    (= (sq-avg 10 13) 134.5)

## Task 3

Define predicates that check:

- whether two numbers are not equal:
  - **in one line without using** if-else;
  - using guards.

- whether a whole number *x* is between two whole numbers - *start* and *end*:
  - **in one line without** using if-else;
  - with a local helper procedure that uses boolean operators.

Test cases:

    (equal? (are-not-equal-one-line? 5 2) #t)
    (equal? (are-not-equal-one-line? 5 5) #f)

    (equal? (are-not-equal-guards? 5 2) #t)
    (equal? (are-not-equal-guards? 5 5) #f)

    (equal? (inside-one-line? 1 5 4) #t) ; start = 1, end = 5, x = 4
    (equal? (inside-one-line? 5 1 4) #t)
    (equal? (inside-one-line? 10 50 200) #f)
    (equal? (inside-one-line? 10 50 1) #f)

    (equal? (inside-boolean-ops? 1 5 4) #t)
    (equal? (inside-boolean-ops? 5 1 4) #t)
    (equal? (inside-boolean-ops? 10 50 200) #f)
    (equal? (inside-boolean-ops? 10 50 1) #f)

## Task 4

Define two procedures that return whether a number is even:

- using if-else;
- using guards.

Test cases:

    (equal? (is-even-if 2) "Yes")
    (equal? (is-even-if 15452) "Yes")
    (equal? (is-even-if 321) "No")

    (equal? (is-even-guards 2) "Yes")
    (equal? (is-even-guards 15452) "Yes")
    (equal? (is-even-guards 321) "No")


## Task 5

Define a recursive and an iterative procedure for calculating the number of digits of a `non-negative` number.

> **Implementation detail**: Use guards!

Test cases:

```scheme
(= (count-digits-iter 12345) 5)
(= (count-digits-iter 123) 3)

(= (count-digits-rec 12345) 5)
(= (count-digits-rec 123) 3)
; (count-digits-iter -13) ; error "n was negative"
```

## Task 6

Define a linearly **iterative** procedure for calculating the sum of the digits of a non-negative number.

Test cases:

```scheme
(= (sum-digits-iter 12345) 15)
(= (sum-digits-iter 123) 6)
; (sum-digits-iter -13) ; error "n was negative"
```


## Task 6

Define a recursive procedure that returns the sum of all prime divisors of a given number.

Test cases:

```scheme
(= (sum-prime-divs-rec 0) 0)
(= (sum-prime-divs-rec 6) 5) ; 2 + 3
(= (sum-prime-divs-rec 18) 5) ; 2 + 3
(= (sum-prime-divs-rec 19) 19)
(= (sum-prime-divs-rec 45136) 53)
```

## Task 7

Define a recursive and an iterative procedure that returns the number of palindromes in the interval `[a, b]`.

Test cases:

```scheme
(= (num-palindromes-rec 1 101) 19)
(= (num-palindromes-rec 1 100) 18)
(= (num-palindromes-rec 100 1) 18)

(= (num-palindromes-iter 1 101) 19)
(= (num-palindromes-iter 1 100) 18)
(= (num-palindromes-iter 100 1) 18)
```

## Task 8

Two numbers are amicable if the sum of the divisors of one of them is equal to the other. Define a predicate that checks whether two numbers are amicable.

Test cases:

```scheme
(equal? (amicable? 200 300) #f)
(equal? (amicable? 220 284) #t)
(equal? (amicable? 284 220) #t)
(equal? (amicable? 1184 1210) #t)
(equal? (amicable? 2620 2924) #t)
(equal? (amicable? 6232 6368) #t)
```

## Task 9

Define a procedure `sum-special-primes n d` that returns the sum of the first `n` prime numbers that contain the digit `d`.

Test cases:

```scheme
(= (sum-special-primes 5 2) 392)
(= (sum-special-primes 5 3) 107)
(= (sum-special-primes 10 3) 462)
```

## Task 10

Define a procedure that returns the number of occurrences of a digit in a **non-negative** number.

Test cases:

```scheme
(= (count-occurrences 121 1) 2)
(= (count-occurrences 222 1) 0)
(= (count-occurrences 100 0) 2)
(= (count-occurrences 0 0) 1)
```

## Task 11

A number is interesting if and only if it is evenly divided by the sum of its digits. Define a predicate that checks whether a number is interesting.

Test case:

```scheme
(equal? (interesting? 410) #t)
(equal? (interesting? 212) #f)
(equal? (interesting? 567) #f)
(equal? (interesting? 70) #t)
(equal? (interesting? 5) #t)
(equal? (interesting? 4) #t)
```

## Task 12

Given a divisor `d` and a bound `b`, find the **largest** integer `N`, such that:

```text
N is divisible by d
and N is less than or equal to b
and N is greater than 0.
```

Test cases:

```scheme
(= (max-multiple 2 7) 6)
(= (max-multiple 3 10) 9)
(= (max-multiple 7 17) 14)
(= (max-multiple 10 50) 50)
(= (max-multiple 37 200) 185)
(= (max-multiple 7 100) 98)
```

## Task 13

Define a predicate that accepts a natural number `n` and returns whether n<sup>2</sup> ends in the digits of `n`.

Test cases:

```scheme
(equal? (automorphic? 3)#f)
(equal? (automorphic? 10)#f)
(equal? (automorphic? 5)#t)
(equal? (automorphic? 25)#t)
(equal? (automorphic? 76)#t) 
(equal? (automorphic? 890625)#t) 
(equal? (automorphic? 625)#t) 
(equal? (automorphic? 36) #f)
(equal? (automorphic? 11) #f)
; (automorphic? -1) ; error: n was not natural
; (automorphic? 0) ; error: n was not natural
```

## Task 14

A cubic prime number is a prime number that is the difference between two subsequent natural numbers. For example, 61 is such a number because 61 = 5<sup>3</sup> - 4<sup>3</sup>. Define a procedure that returns the n<sup>th</sup> cubic prime number.

Test cases:

```scheme
(= (nth-cubic 1) 7)
(= (nth-cubic 4) 61) ; 61 is the 4th cubic prime number
(= (nth-cubic 50) 55897) ; 55897 is the 50th cubic prime number
(= (nth-cubic 100) 283669)
(= (nth-cubic 200) 1570357)
; (nth-cubic 0) ; should return an error
```

## Task 15

Write a procedure that accepts three whole numbers - `a`, `b` and `n` (assume `n > 3`) and returns the **sum** of the **last three** numbers from the following sequence.

![Alt text](./assets/seq.png?raw=true "seq")

Test cases:

```scheme
(= (find-sum 0 2 10) 3578) ; 510 + 1022 + 2046
(= (find-sum 5 3 5) 174) ; 26 + 50 + 98
```

Explanations:

In the first example a = 0, b = 2, n = 10. The resulting sequence is therefore s0, s1, s2, ...

- s0 = 0 + 1x2 = 2
- s1 = 0 + 1x2 + 2x2 = 6
- s2 = 0 + 1x2 + 2x2 + 4x2 = 14 and so on.

In the second example a = 5, b = 3, n = 5. The resulting sequence is therefore s0, s1, s2, ...

- s0 = 5 + 1x3 = 8
- s1 = 5 + 1x3 + 2x3 = 14
- s2 = 5 + 1x3 + 2x3 + 4x3 = 26 and so on.
