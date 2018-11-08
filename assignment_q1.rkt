#lang racket

;A cons pair of two numbers.
(cons 1 2)

;A list of 3 numbers using cons.
(cons '1(cons '2(cons '3 '())))

;A list containing a string, a number and a nested list of three numbers, using only the cons function.
(cons "String"(cons 1(cons '(2 3 4) empty)))

;A list containing a string, a number and a nested list of three numbers, using only the list function.
(list "String" 1 '(2 3 4))

;A list containing a string, a number and a nested list of three numbers, using only the append function.
(append '("String") '(1) '((2 3 4)))

;PART B Comment on Results:
; Cons must always take two values, as can be seen in part A and B above. Both list and append can take an infinite amount as seen in the other parts.
; Append actually uses cons to make a list. It reads in the values from left to right.
; Append will fail is a value is not a list if it isn't the last value.
; list works straight forward and joins items into one list.

