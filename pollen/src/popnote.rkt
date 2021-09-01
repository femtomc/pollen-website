#lang racket

(provide popup)

(define (popup . texts) 
  `(a ((class "footnote")) "*" (span ,@texts)))
