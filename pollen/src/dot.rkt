#lang racket

(provide dot)

#|
GraphViz
|#

(define (not-newline? s) (not (eq? s "\n")))

;;
;; This defines a very simple Pollen interface to GraphViz
;; Requires `dot` available on $PATH.
;;

(define (dot #:dir [dir "images"] 
             #:css-class [css-class "dot"]
             . digraph)
  (make-directory* dir)
  (define g (string-append "digraph G {\n" 
                           (apply string-append digraph)
                           "\n}"))
  (define path (build-path dir (~a "dot_" (equal-hash-code g) ".dot")))
  (define img-path (build-path dir (~a "dot_" (equal-hash-code g) ".png")))
  (with-output-to-file path (lambda() (printf g))
                       #:exists 'replace)
  (define cmd (string-append "dot -Tpng -Gdpi=300 "
                             (path->string path)
                             " > "
                             (path->string img-path)))
  (process cmd)
  `(img ((class ,css-class) (src ,(path->string img-path)))))
