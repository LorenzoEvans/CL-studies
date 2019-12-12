;;; (+ 4 4)
; (print (eval (+ 5 5)))

; (print (+ 9 9))

; Chapter 1: Introduction to Lisp.

; Computers allow one to carry out computations.

; A word processing program does so on words, a calculator, numbers,
; however, the principles do not differ.
; Both cases :: provide input -> specify operations -> yield result.

; Anything that can be represented in memory is a (computational) object.
; Operations, since they can be stored in memory, are themselves objects.

; Often we distinguish between users and programmers-
; Users provide new input, whereas programmers define new operations,
; or even new  types of acceptable input.


; 1.1: Symbolic Computation.
; Besides numbers, we can represent letters, strings, and symbols.
; Non-atomic values are built by combining objects into lists.

; (print (append '("Jack" "Lyle") '("Eric" "Marc")))

; (eval (append '("Pat" "Kim") '("Robin" "Sandy")))
; The above expression appends two lists of names.
; The quote mark blocks the evaluation of the following value,
; which keeps the strings Pat/Robin from being evaluated as functions,
; Succinctly :: ' turns the following value into data.

; About symbols

; Lisp attaches no external significance to symbols, while we recognize the
; above as names, Lisp makes no distinctions about symbols, so long as the
; syntax is correct.

; Symbols in lisp are *not* case sensitive. John == jOhN = jOHn.

; A wide range of characters are acceptable for symbols.

; (print (append '(Pat Kim) (list '(Robin Sandy) '(John Q Public))))


; 1.2 (Variables): In computation, we need the ability to define new objects,
; in terms of others. Symbols are quite useful for this.

; One way to assign values to variables is with setf.

(setf p '(John Q Public))
; (print p)
(append p 'Aurelius)
; (print p) ; CL-USER> (JOHN Q PUBLIC) (Immutability preserves values)
; (print (append p 'Aurelius)) ; This will capture the change and print it.

(setf int-ten 10)
; (print (+ int-ten int-ten))
(setf p (append p '(Aurelius))) ; You can re-assign values to a variable, using the variables previous value.
; (print (+ int-ten (length q))) ; Length is built in function for lists.

; 1.4 Special Forms

; setf violates the evaluation rule followed by *functions*, which evaluate all of their arguments, and then apply themselves to said arguments.

; setf doesn't follow this rule because it is a *special form*, which are a part of the lisp syntax.
; These forms are always lists in which the first element is a privileged symbol.
; Also, special forms return a value, as opposed to just applying an effect to some values.

; The term special form not only refers to the keywords, but any form that begins with them, making (setf p (append p '(Aurelius))) a special form.

; It turns out that the quote mark, is syntactic sugar for the special form quote,
; a special form that evaluates to the data it's given.

; special forms include: defun, defparameter, setf, let, case, if, function and quote

; 1.4 Lists

; append and length aren't the only list processing functions

; The functions 'first' through to 'fourth' grab those elements from lists.

; The function rest grabs the rest of the list, after the first.

; nil and () are synonymous, and thus both equate to false.

(setf x '((1st element) 2 (element 3) ((4)) 5))
; (print x)

; (print (cons 'Mr p))
; (print (cons (first p) (rest p)))

(setf town (list 'Anytown 'Usa))
; (print (list p 'of town 'may 'have 'already 'won!))

; 1.5 Defining new functions.
(defun last-name (name)
  (first (last name))) ; last is built in

(defun first-name (name)
  (first name))

; Functions receive a name first, and a parameter list.
; Functions can also have a doc string describing the functions purpose.
; Function names must be valid symbols, with the body consisting of expressions
; to be evaluate when the function is called.
; The last expression evaluated is returned as the functions value.

; The problem here is that last name doesn't define a persons last name,
; but rather an element of a list.
; We can define first name as well, which is good practice, in that first
; will differ in it's use from first-name, *even though they perform the same operation*

(setf names '((John Q Public) (Malcolm X)
              (Admiral Grace Murray Hopper) (Spot)
              (Aristotle) (A A Milne) (Z Z Top)
              (Sir Larry Olivier) (Miss Scarlet)))

; 1.6 Using functions
; One good thing about defining lists, is they allow for easier use of functions.

(mapcar #'last-name names)

; The #' notation maps the name of a function, to the function itself.
; The built in function mapcar is passed two arguments, a function, and a list,
; calling the function on each item of the list.

; Map is self explanatory, but car refers to the lisp function car, which is
; an archaic term for first, meaning Contents of the Address Register.

; There's an archaic term for rest, which is cdr, or Contents of the Decrement Register

; Mapcar examples

(mapcar #'- '(1 2 3 4)) ; => -1 -2 -3 -4
(mapcar #'+ '(1 2 3 4) '(10 20 30 40)) ; => 11 22 33 44

; Mapcar can be passed another list, in general, mapcar expects a n-ary fn,
; and n lists, applying the function to the first element of each list.
; So, the n's must match. Functions expecting n arguments need n lists.

(mapcar #'first-name names)
; returns (JOHN MALCOLM ADMIRAL SPOT ARISTOTLE A Z SIR MISS)

; The problem here is that some of these aren't "true" first names.

(defparameter *titles*
  '(Mr Mrs Miss Sir Madam Dr Admiral Major General))

; defparameter is a new special form, which defines a variable that does not
; change over the course of computation, but may be subject to changes via programmer.

; Now that we have this, we should re-define first-name, saying that if the
; first word of a name is a title, ignore it, then return the first-name of
; the rest of the list.

; We use the special form if, which evaluates a boolean test expression,
; and a branch for if the test returns true or false. As with most special forms,
; every argument to an if is not evaluated.

(defun first_name (name)
  (if (member (first name) *titles*)
    (first_name (rest name))
    (first name)))

(print (mapcar #'first_name names)) 
; => (JOHN MALCOLM GRACE SPOT ARISTOTLE A Z LARRY SCARLET) 
