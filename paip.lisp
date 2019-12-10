;;; (+ 4 4)
(print (eval (+ 5 5)))

(print (+ 9 9))

; Computers allow one to carry out computations.

; A word processing program does so on words, a calculator, numbers,
; however, the principles do not differ.
; Both cases :: provide input -> specify operations -> yield result.

; Anything that can be represented in memory is a (computational) object.
; Operations, since they can be stored in memory, are themselves objects.

; Often we distinguish between users and programmers-
; Users provide new input, whereas programmers define new operations,
; or even new  types of acceptable input.


; Symbolic Computation:
; Besides numbers, we can represent letters, strings, and symbols.
; Non-atomic values are built by combining objects into lists.

; (print (append '("Jack" "Lyle") '("Eric" "Marc")))

; (eval (append '("Pat" "Kim") '("Robin" "Sandy")))
; The above expression appends two lists of names.
; The quote mark blocks the evaluation of the following value,
; which keeps the strings Pat/Robin from being evaluated as functions,
; Succinctly :: ' turns the following value into data.



(print (append '(Pat Kim) (list '(Robin Sandy) '(John Q Public))))

; About symbols

; Lisp attaches no external significance to symbols, while we recognize the
; above as names, Lisp makes no distinctions about symbols, so long as the
; syntax is correct.

; Symbols in lisp are *not* case sensitive. John == jOhN = jOHn.

; A wide range of characters are acceptable for symbols.

; 
