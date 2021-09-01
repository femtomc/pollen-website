#lang racket

(provide cmd)

(define (cmd . code)
  (apply system code))
