(group "List predicates"

  (procedure
   (purpose "Test whether something is a pair or null")
   (in common-lisp listp)
   (in emacs-lisp listp)
   (in scheme "(or (null? x) (pair? x))")
   (in racket "(or (null? x) (pair? x))"))

  (procedure
   (purpose "Test whether something is a proper list")
   (in common-lisp "proper-list-p" alexandria)
   (in emacs-lisp "proper-list-p")
   (in scheme "proper-list?")  ; Or is RnRS `list?` enough?
   (in racket "list?")
   (in clojure "list?"))  ; Clojure does not have improper lists.

  (procedure
   (purpose "Test whether a list is empty")
   (in common-lisp null)
   (in emacs-lisp null)
   (in scheme null?)
   (in clojure empty?)
   (in standard-ml "List.null")
   (in ocaml "")
   (in fsharp ".IsEmpty")
   (in elm "List.isEmpty")))

(group "List constructors"

  (procedure
   (purpose "Make a pair of two objects")
   (in common-lisp cons)
   (in emacs-lisp cons)
   (in scheme cons)
   (in clojure cons)
   (in standard-ml "::")
   (in ocaml "::")
   (in fsharp "::")
   (in elm "::"))

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

(group "List destructuring"

  (procedure
   (purpose "Get the first element of a list")
   (in common-lisp car)
   (in emacs-lisp car)
   (in scheme car)
   (in racket car)
   (in clojure first)
   (in standard-ml "List.hd")
   (in ocaml "List.hd")
   (in fsharp "List.head")
   (in elm "List.head"))

  (procedure
   (purpose "Get all but the first element of a list")
   (in common-lisp cdr)
   (in emacs-lisp cdr)
   (in scheme cdr)
   (in racket cdr)
   (in clojure rest)
   (in standard-ml "List.tl")
   (in ocaml "List.tl")
   (in fsharp "List.tail")
   (in elm "List.tail"))

  (procedure
   (purpose "Get the n'th element of a list")
   (in common-lisp nth)
   (in emacs-lisp nth)
   (in scheme list-ref)
   (in racket list-ref)
   (in clojure nth)
   (in standard-ml "List.nth")
   (in ocaml "List.nth")
   (in fsharp "List.item")))

(group "List making (non-destructive)"

  (procedure
   (purpose "Concatenate lists given as arguments (copy all but the last)")
   (in common-lisp append)
   (in emacs-lisp append)
   (in scheme append)
   (in racket append)
   (in clojure concat)
   (in standard-ml "List.@")
   (in ocaml "List.append")
   (in fsharp "List.append")
   (in elm "List.append"))

  (procedure
   (purpose "Concatenate lists given in a list (copy all)")
   (in scheme concatenate (srfi 1))
   (in racket concatenate srfi/1)
   (in standard-ml "List.concat")
   (in ocaml "List.concat")
   (in fsharp "List.concat")
   (in elm "List.concat"))

  (procedure
   (purpose "Reverse a list (copy)")
   (in common-lisp reverse)
   (in emacs-lisp reverse)
   (in scheme reverse)
   (in racket reverse)
   (in clojure reverse)
   (in standard-ml "List.rev")
   (in ocaml "List.rev")
   (in fsharp "List.rev")
   (in elm "List.reverse"))

  (procedure
   (purpose "Reverse a list (copy) then append to that (not copy)")
   (in common-lisp revappend)
   (in emacs-lisp cl-revappend)
   (in scheme append-reverse (srfi 1))
   (in racket append-reverse srfi/1)
   (in standard-ml List.revAppend)
   (in ocaml "List.rev_append")))

(group "List making (destructive)"

  (procedure
   (purpose "Reverse a list")
   (in common-lisp nreverse)
   (in emacs-lisp reverse)
   (in scheme reverse)
   (in racket reverse)
   (in clojure reverse)
   (in standard-ml "List.rev")
   (in ocaml "List.rev")
   (in fsharp "List.rev")
   (in elm "List.reverse"))

  (procedure
   (purpose "Reverse a list (in place) then append to that (not copy)")
   (in common-lisp nreconc)
   (in emacs-lisp cl-nreconc)
   (in scheme append-reverse! (srfi 1))
   (in racket append-reverse! srfi/1)))

(group "List traversal"

  (procedure
   (purpose "Apply function to each element, collect results into list")
   (in common-lisp mapcar)
   (in emacs-lisp mapcar)
   (in scheme map)
   (in racket map)
   (in clojure map)
   (in standard-ml "List.map")
   (in ocaml "List.map")
   (in fsharp "List.map")
   (in elm "List.map"))

  (procedure
   (purpose "Apply function to each element, concatenate resulting lists")
   (in common-lisp mapcan)
   (in emacs-lisp mapcan)
   (in scheme append-map (srfi 1))
   (in racket append-map)
   (in standard-ml "List.map")
   (in ocaml "List.concat_map")
   (in fsharp "List.collect")
   (in elm "List.concatMap"))

  (procedure
   (purpose "Apply function to each element, ignore results")
   (in common-lisp mapc)
   (in emacs-lisp mapc)
   (in scheme for-each)
   (in racket for-each)
   (in clojure run!)
   (in standard-ml "List.app")
   (in ocaml "List.")
   (in fsharp ".length")))

(group "List iteration"

  (procedure
   (purpose "Get the number of elements in a proper list")
   (in common-lisp length)
   (in emacs-lisp length)
   (in scheme length)
   (in racket length)
   (in clojure count)
   (in standard-ml "List.length")
   (in ocaml "List.length")
   (in fsharp ".length")
   (in elm "List.length")))

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
