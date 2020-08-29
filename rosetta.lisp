(group "List"

  (procedure
   (purpose "Make a pair of two objects")
   (in common-lisp cons)
   (in emacs-lisp cons)
   (in scheme cons)
   (in clojure cons))

  (procedure
   (purpose "Make a list of an element repeated N times")
   (in common-lisp "(make-list N :initial-element x)")
   (in emacs-lisp make-list)
   (in scheme make-list)
   (in clojure "(into () (repeat N x))"))

  (procedure
   (purpose "Make a list of the given elements")
   (in common-lisp list)
   (in emacs-lisp list)
   (in scheme list)
   (in clojure list))

  (procedure
   (purpose "Make a list of the given elements and a tail")
   (in common-lisp list*)
   (in emacs-lisp list*)
   (in scheme cons* (srfi 1))
   (in clojure list*)))

(group "Vector"

  (procedure
   (purpose "Make a vector of an element repeated N times")
   (in common-lisp "(make-array N :initial-element x)")
   (in emacs-lisp make-vector)
   (in scheme make-vector)
   (in clojure "(into [] (repeat N x))"))

  (procedure
   (purpose "Make a vector of the given elements")
   (in common-lisp vector)
   (in emacs-lisp vector)
   (in scheme vector)
   (in clojure vector)))

(group "List as set"

  (procedure
   (purpose "Union of two sets")
   (in common-lisp union)
   (in emacs-lisp cl-union)
   (in scheme lset-union (srfi 1)))

  (procedure
   (purpose "Intersection of two sets")
   (in common-lisp intersection)
   (in emacs-lisp cl-intersection)
   (in scheme lset-intersection (srfi 1)))

  (procedure
   (purpose "Difference of two sets")
   (in common-lisp set-difference)
   (in emacs-lisp cl-set-difference)
   (in scheme lset-difference (srfi 1))))

(group "Set"

  (procedure
   (purpose "Union of two sets")
   (in scheme set-union (srfi 113))
   (in clojure union clojure.set))

  (procedure
   (purpose "Intersection of two sets")
   (in scheme set-intersection (srfi 113))
   (in clojure intersection clojure.set))

  (procedure
   (purpose "Difference of two sets")
   (in scheme set-difference (srfi 113))
   (in clojure difference clojure.set)))

(group "Character"

  (procedure
   (purpose "Translate a Unicode character to uppercase")
   (in scheme char-upcase)
   (in common-lisp char-upcase)
   (in clojure upper-case clojure.string))

  (procedure
   (purpose "Translate a Unicode character to lowercase")
   (in scheme char-downcase)
   (in common-lisp char-downcase)
   (in clojure lower-case clojure.string)))

(group "String"

  (procedure
   (purpose "Translate a Unicode string to uppercase")
   (in scheme string-upcase)
   (in common-lisp string-upcase)
   (in clojure upper-case clojure.string))

  (procedure
   (purpose "Translate a Unicode string to lowercase")
   (in scheme string-downcase)
   (in common-lisp string-downcase)
   (in clojure lower-case clojure.string))

  (procedure
   (purpose "Concatenate many strings into one")
   (in scheme string-append)
   (in common-lisp "concatenate #'string")
   (in clojure str)))

(group "Regular expression"

  (procedure
   (purpose "Replace all occurrences of regexp with string")
   (in scheme (regexp-replace old-regexp str new-string) (srfi 115))
   (in racket (regexp-replace* old-regexp str new-string))
   (in clojure (replace str old-regexp new-string) clojure.string)))
