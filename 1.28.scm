(define (prime? n)
  ; fast-exp to calculate a^(n-1) (mod n) with detection of trivial situation
  (define (expmod-test a n cnt result)
    (cond ((= cnt 0) result)
          ((even? cnt)
           (if (and
                (= (remainder (square a) n) 1)
                (not (= a 1))
                (not (= a (- n 1))))
               0
               (expmod-test (remainder (square a) n) n (/ cnt 2) result)))
          (else (expmod-test a n (- cnt 1) (remainder (* result a) n)))))

  (define (miller-rabin-iter a n)
    (cond ((= a n) #t)
          ((not (= 1 (expmod-test a n (- n 1) 1))) #f)
          (else (miller-rabin-iter (+ a 1) n))))
  (miller-rabin-iter 2 n))
