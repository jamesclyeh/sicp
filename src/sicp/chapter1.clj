;; Newton's sqrt methods

(defn sqrt
  ([x] (sqrt x 1.0))
  ([x guess]
    (letfn [(good-enough? [guess]
              (< (Math/abs (- x (* guess guess))) 0.001))
            (improve [guess]
              (/ (+ (/ x guess) guess) 2))]
      (if (good-enough? guess)
        guess
        (recur x (improve guess))))))

(defn sqrt-improved
  ([x] (sqrt-improved x 1.0 0))
  ([x guess prev-guess]
    (letfn [(good-enough? [guess prev-guess]
              (< (Math/abs (- guess prev-guess)) (* guess 0.001)))
            (improve [guess]
              (/ (+ (/ x guess) guess) 2))]
      (if (good-enough? guess prev-guess)
        guess
        (recur x (improve guess) guess)))))

;; Factorial

(defn factorial [n]
  (if (= n 0)
    1
    (* n (factorial (dec n)))))

(defn factorial-iter [n]
  (loop [counter n accu 1]
    (if (zero? counter)
      accu
      (recur (dec counter) (* accu counter)))))
