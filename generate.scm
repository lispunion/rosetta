(import (scheme base) (scheme char) (scheme cxr) (scheme file)
        (scheme read) (scheme write))

(define (append-map f xs)
  (let loop ((acc '()) (xs xs))
    (if (null? xs) acc (loop (append acc (f (car xs))) (cdr xs)))))

(define (read-all)
  (let loop ((xs '()))
    (let ((x (read)))
      (if (eof-object? x) (reverse xs) (loop (cons x xs))))))

(define (written x)
  (call-with-port (open-output-string)
                  (lambda (out) (write x out) (get-output-string out))))

(define (display-sxml x)
  (define (display* . xs) (for-each display xs))
  (define (display-char char)
    (let* ((cc (char->integer char))
           (ok? (case char ((#\& #\< #\> #\") #f) (else (<= #x20 cc #x7e)))))
      (if ok? (display char) (display* "&#" cc ";"))))
  (define (display-attribute attribute)
    (display* " " (car attribute) "=\"")
    (string-for-each display-char (cadr attribute))
    (display "\""))
  (cond ((pair? x)
         (display* "<" (car x))
         (let ((body (cond ((and (pair? (cdr x))
                                 (pair? (cadr x))
                                 (eq? '@ (car (cadr x))))
                            (for-each display-attribute (cdr (cadr x)))
                            (cddr x))
                           (else (cdr x)))))
           (display ">")
           (for-each display-sxml body)
           (unless (memq (car x) '(meta))
             (display* "</" (car x) ">"))))
        ((string? x)
         (string-for-each display-char x))
        (else (error "Bad:" x))))

(define dialects-of-lisp
  '((common-lisp "Common Lisp")
    (emacs-lisp "Emacs Lisp")
    (scheme "Scheme")
    (racket "Racket")
    (clojure "Clojure")))

(define dialects-of-ml
  '((standard-ml "Standard ML")
    (ocaml "OCaml")
    (fsharp "F#")
    (elm "Elm")))

(define languages
  (append dialects-of-lisp
          dialects-of-ml))

(define language-id car)
(define language-title cadr)

(define group-title cadr)
(define group-procedures cddr)

(define (procedure-purpose proc)
  (cadr (or (assoc 'purpose (cdr proc))
            (error "No purpose"))))

(define (procedure-in-fold kons acc proc)
  (let loop ((acc acc) (pairs (cdr proc)))
    (if (null? pairs) acc
        (let ((pair (car pairs)))
          (loop (if (eq? 'in (car pair))
                    (kons (cadr pair) (caddr pair) acc)
                    acc)
                (cdr pairs))))))

(define (procedure-in goal-language proc)
  (or (procedure-in-fold (lambda (language translation match)
                           (or match (and (eq? goal-language language)
                                          translation)))
                         #f proc)
      ""))

(define (procedure-unknown-languages proc)
  (let ((known (map language-id languages)))
    (procedure-in-fold (lambda (language translation unknown)
                         (if (member language known) unknown
                             (cons language unknown)))
                       '() proc)))

(define (stringify x)
  (cond ((string? x) x)
        ((symbol? x) (symbol->string x))
        ((list? x) (written x))
        (else (error "Huh?"))))

(define (big-table)
  (let ((groups (with-input-from-file "rosetta.lisp" read-all)))
    `(table
      (tr (th (@ (class "hidden")))
          (th (@ (colspan ,(number->string (length dialects-of-lisp)))
                 (class "lisp"))
              "Lisp")
          (th (@ (colspan ,(number->string (length dialects-of-ml)))
                 (class "ml"))
              "ML"))
      (tr (th (@ (class "hidden")))
          ,@(map (lambda (language) `(th ,(language-title language)))
                 languages))
      ,@(append-map
         (lambda (group)
           `((tr (th (@ (colspan ,(number->string (+ 1 (length languages))))
                        (class "group"))
                     ,(group-title group)))
             ,@(map
                (lambda (proc)
                  (let ((unknown (procedure-unknown-languages proc)))
                    (unless (null? unknown) (error "Unknown:" unknown)))
                  `(tr (td ,(procedure-purpose proc))
                       ,@(map (lambda (language)
                                (let ((x (procedure-in (language-id language)
                                                       proc)))
                                  `(td (@ (class ,(if (assoc (language-id language)
                                                             dialects-of-lisp)
                                                      "lisp"
                                                      "ml")))
                                       (code ,(stringify x)))))
                              languages)))
                (group-procedures group))))
         groups))))

(define (display-page)
  (let ((title "Lisp/ML Rosetta Stone"))
    (display "<!doctype html>")
    (display-sxml
     `(html
       (@ (lang "en"))
       (head
        (title ,title)
        (meta (@ (charset "UTF-8")))
        (style ""
          "body { font-family: sans-serif; background-color: beige;"
          " max-width: 40em; margin: 12px; }"
          "table { border-collapse: collapse; }"
          "table, th, td { border: 1px solid black; }"
          "th, td { vertical-align: top; padding: 2px; }"
          "th.group { background-color: sandybrown; }"
          "th.hidden { border: 0; }"
          ".red { background-color: sandybrown; }"
          "th.lisp { background-color: lightgreen; }"
          "td.lisp { background-color: lightgreen; }"
          "th.ml { background-color: lightblue; }"
          "td.ml { background-color: lightblue; }"))
       (body
        (h1 ,title)
        ,(big-table))))
    (newline)))

(with-output-to-file "index.html" display-page)
