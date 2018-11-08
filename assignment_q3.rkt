#lang racket

(define tree'(((() 1 ()) 2 (() 7 ())) 10 ((() 11 ()) 13 (() 16 ()))))

;Part A - Display in sorted order the contents of a binary search tree.
(define (display_tree tree)
  (begin (cond [(not (empty? (car tree)))
               (display_tree  (car tree))])
         (display  (cadr tree))(display"\n")
         (cond [(not (empty? (caddr tree)))
               (display_tree  (caddr tree))])))

(display_tree tree)

;Part B
(define (in_tree tree el)
  (cond [(equal? (cadr tree) el) #t]
        [(< el (cadr tree)) (in_tree (car tree) el)] 
        [(> el (cadr tree)) (in_tree (caddr tree) el)]
        [(empty? tree) #f]))
(in_tree tree '2)

;Part C
(define (insert_element el tree)
  (insert_element1 el tree <))

(define (insert_element1 el tree left_of)
  (cond [(empty? tree) (list '() el '())]
        [(equal? el (cadr tree)) tree]
        [(left_of el (cadr tree))
        (list (insert_element1 el (car tree) left_of) (cadr tree) (caddr tree))]
        [else (list (car tree) (cadr tree) (insert_element1 el (caddr tree) left_of))]))
(insert_element 4 tree)

;Part D
(define (insert_elements list tree)
  (if (empty? list) tree
  (insert_elements (cdr list) (insert_element1 (car list) tree <))))
(insert_elements '(10 20 30) tree)

;Part E
(define (tree_sort list)
  (display_tree (insert_elements list '())))
(tree_sort '(4 2 8 10 21 19))

;Part F
;(define (



