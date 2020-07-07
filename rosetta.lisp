;; Pairs, lists, trees

(procedure
 (purpose "Make a pair of two objects")
 (in common-lisp cons)
 (in scheme cons)
 (in clojure cons))

(procedure
 (purpose "Make a list of an element repeated N times")
 (in common-lisp "(make-list N :initial-element x)")
 (in scheme make-list)
 (in clojure "(into () (repeat N x))"))

(procedure
 (purpose "Make a list of the given elements")
 (in common-lisp list)
 (in scheme list)
 (in clojure list))

(procedure
 (purpose "Make a list of the given elements and a tail")
 (in common-lisp list*)
 (in scheme cons* (srfi 1))
 (in clojure list*))

;; Vectors

(procedure
 (purpose "Make a vector of an element repeated N times")
 (in common-lisp "(make-array N :initial-element x)")
 (in scheme make-vector)
 (in clojure "(into [] (repeat N x))"))

(procedure
 (purpose "Make a vector of the given elements")
 (in common-lisp vector)
 (in scheme vector)
 (in clojure vector))

;; Sets

(procedure
 (purpose "Union of two sets")
 (in common-lisp union)
 (in scheme lset-union (srfi 1))
 (in scheme set-union (srfi 113))
 (in clojure union clojure.set))

(procedure
 (purpose "Intersection of two sets")
 (in common-lisp intersection)
 (in scheme lset-intersection (srfi 1))
 (in scheme set-intersection (srfi 113))
 (in clojure intersection clojure.set))

(procedure
 (purpose "Difference of two sets")
 (in common-lisp set-difference)
 (in scheme lset-difference (srfi 1))
 (in scheme set-difference (srfi 113))
 (in clojure difference clojure.set))

;; Characters

(procedure
 (purpose "Translate a Unicode character to uppercase")
 (in scheme char-upcase)
 (in common-lisp char-upcase)
 (in clojure upper-case clojure.string))

(procedure
 (purpose "Translate a Unicode character to lowercase")
 (in scheme char-downcase)
 (in common-lisp char-downcase)
 (in clojure lower-case clojure.string))

;; Strings

(procedure
 (purpose "Concatenate many strings into one")
 (in scheme string-append)
 (in common-lisp "concatenate #'string")
 (in clojure str))
