#lang pollen

◊(define-meta template "post-template.html")

◊h1{Probabilistic programming, the first part}

The goal of probabilistic programming is to automate the computational process described by Bayes' rule:

◊$${P(A | B) = \frac{P(B | A) P(A)}{P(B)}}

This computational process is hard -- because the computation of the denominator involves an integral

◊$${P(B) = \int_{dom(A)} P(A, B) \ dA}

So, generically, practitioners of probabilistic programming explore spaces where this computational process can be reduced to another, more tractable process - or the integral can be evaluated analytically.
