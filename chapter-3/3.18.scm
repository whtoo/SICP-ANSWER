(define (cycle? x)
  (define (iter x visited)
    (cond ((not (pair? x)) #f)
          ((null? (cdr x)) #f)
          ((memq (cdr x) visited) #t)
          (else (iter (cdr x) (cons x visited)))))
  (iter x '()))

(define cycle (list 'a 'b))
(set-cdr! cycle cycle)
(newline)
(display (cycle? cycle))

(define t0 (cons 'a 'b))
(define t1 (cons t0 t0))
(newline)
(display (cycle? t1))