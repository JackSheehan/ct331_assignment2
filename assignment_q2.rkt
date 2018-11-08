#lang racket

(provide ins_beg)
(provide ins_end)
(provide count_top_level)
(provide count_instances)
(provide count_instances_tr)
(provide count_instances_tr1)
(provide count_instances_deep)

;Part A
(define (ins_beg el lst)
  (append (list el) lst))
(ins_beg 'a '(b c d))

;Part B
(define (ins_end el lst)
  (append lst (list el)))
(ins_end 'a '(b c d))

;Part C
(define (count_top_level list)
  (if (null? list)
      0
  (+ 1 (count_top_level (cdr list)))))
(count_top_level '(a b c d e f))

;Part D
(define (count_instances el list)
  (cond ((null? list)0)
        ((equal? el (car list))(+ 1(count_instances el (cdr list))))
        ((count_instances el(cdr list)))))
(count_instances 'a '(a b c f h g a r e a g y u))

;Part E
(define (count_instances_tr el list)
  (count_instances_tr el list 0))

(define (count_instances_tr1 el list total)
  (cond [(empty? list) total]
    [(equal? (car list) el) (count_instances_tr1 el (cdr list) (+ 1 total))]
    [else (count_instances_tr1 el (cdr list) total)]))

(count_instances_tr1 'a '(a v c a f g d a f d a) 0)

;Part F
(define (count_instances_deep el list)
  (cond [(empty? list) 0]
        [(list? (car list)) (+ (count_instances_deep el (car list)) (count_instances_deep el (cdr list)))]
        [(equal? el (car list)) (+  1 (count_instances_deep el (cdr list)))]
        [else (count_instances_deep el (cdr list))]))
(count_instances_deep 'a '(a b c f d e a '(a d a c f) d e f a '(j k u n n a)))
       
      

  
