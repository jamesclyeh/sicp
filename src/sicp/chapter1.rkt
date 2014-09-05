#lang planet neil/sicp
 
; Common functions used in Newton's method

(define (average numbers)
  (/ (apply + numbers) (length numbers)))

; Newton's square root method
(define (sqrt x)
  (define (goodenough? guess)
    (< (abs (- x (* guess guess))) 0.001))
  (define (improve guess)
    (average (list (/ x guess) guess)))
  (define (sqrt-with-guess guess)
    (if (goodenough? guess)
      guess
      (sqrt-with-guess (improve guess))))
  (sqrt-with-guess 1.0))

; Improved Newton's square root method
(define (sqrt-improved x)
  (define (goodenough? guess prev-guess)
    (< (abs (- guess prev-guess)) (* 0.001 guess)))
  (define (improve guess)
    (average (list (/ x guess) guess)))
  (define (sqrt-with-guesses guess prev-guess)
    (if (goodenough? guess prev-guess)
      guess
      (sqrt-with-guesses (improve guess) guess)))
  (sqrt-with-guesses 1.0 0))

; Range function
(define (range-start-stop-step start stop step)
  (if (>= start stop)
      nil
      (cons start (range-start-stop-step (+ start step) stop step))))

(define (range-stop stop)
  (range-start-stop-step 0 stop 1))

(define (range-start-stop start stop)
  (range-start-stop-step start stop 1))

; Factorial with recursion
(define (factorial n)
  (if (<= n 1)
      1
      (* n (factorial (- n 1)))))

; Factorial with range funciton
(define (factorial-range n)
  (apply * (range-start-stop 1 (+ n 1))))