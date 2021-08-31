#lang racket

(provide document-class
         use-package
         env
         latex)

#|
LaTeX
|#

;;
;; This defines a simple interface to compile
;; and include PNGs from LaTeX
;;

(define (document-class #:option [option "standalone"] x)
  (string-append "\\documentclass[" x "]{" option "}"))

(define (use-package x)
  (string-append "\\usepackage{" x "}"))

(define (env x . code)
  (string-append "\\begin{" x "}"
                 (apply string-append code)
                 "\\end{" x "}"))

(define (latex #:dir [dir "compiled/images"]
               #:document [document "tikz"]
               #:ext [ext "png"]
               #:convert [convert "-quality 90"]
               #:css-class [css-class "latex"]
               . code)
  (make-directory* dir)
  (define latex (apply string-append code))
  (define path (build-path dir (~a "latex_" (equal-hash-code latex) ".tex")))
  (define pdf-path (build-path dir (~a "latex_" (equal-hash-code latex) ".pdf")))
  (define img-path (build-path dir (~a "latex_" (equal-hash-code latex) "." ext)))
  (with-output-to-file path (lambda () (printf latex))
                       #:exists 'replace)
  (define latex-cmd (string-append 
                      "pdflatex "
                      "-output-directory "
                      dir
                      " "
                      (path->string path)))
  (define img-cmd (string-append 
                    "convert -density 300 "
                    convert
                    " "
                    (path->string pdf-path)
                    " "
                    (path->string img-path)))
  (system latex-cmd)
  (system img-cmd)
  `(img ((class ,css-class) (src ,(path->string img-path)))))
