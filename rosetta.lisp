;; Pairs, lists, trees

(procedure
 (purpose "Make a pair of two objects")
 (in common-lisp cons)
 (in scheme cons)
 (in clojure cons))

(procedure
 (purpose "Make a list of an element repeated N times")
 (in common-lisp make-list)
 (in scheme make-list))

;; Sets

(procedure
 (purpose "Union of two sets")
 (in common-lisp union)
 (in scheme lset-union (srfi 1)))

(procedure
 (purpose "Intersection of two sets")
 (in common-lisp intersection)
 (in scheme lset-intersection (srfi 1)))

(procedure
 (purpose "Difference of two sets")
 (in common-lisp set-difference)
 (in scheme lset-difference (srfi 1)))

;; Characters

(procedure
 (purpose "Translate a Unicode character to uppercase")
 (in scheme char-upcase)
 (in common-lisp char-upcase))

;; Strings

(procedure
 (purpose "Concatenate many strings into one")
 (in scheme string-append)
 (in common-lisp "concatenate #'string")
 (in clojure str))
