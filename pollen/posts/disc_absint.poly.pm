#lang pollen

◊(define-meta template "post-template.html")

◊title{Understanding abstract interpretation}

Abstract interpretation is a difficult topic - the literature tutorial treatment is typically restricted to toy languages. Most tutorials also do not cover abstract domain design or the process of designing an analysis within the abstract interpretation framework. At least from my survey, it's also not clear how an industrial strength project like LLVM would begin to incorporate a formal framework for designing abstract interpretations - despite the fact that popular projects (like ◊link["https://julialang.org/"]{the Julia language and compiler implementation}) incorporate abstract interpretation for type propagation and performance optimizations.

I want to convey the essence of abstract interpretation - while also providing a small tutorial on abstract interpreter framework design with SSA-based intermediate representations.

◊head{The essence}

Abstract interpretation is about deriving information about programs without actually running them. Actually running the program deals with ◊i{the concrete semantics} - computing non-standard properties on this semantics is undecidable for Turing complete languages.

So the point is to imagine running the program with semantics that approximate the concrete semantics in some way - typical examples include interval approximation of values, polyhedral domains (e.g. intervals and equation bounds), shape propagation on arrays, the list goes on.

Highly important is that the abstract semantics satisfies a set of mathematical relations with the concrete semantics - satisfaction of these relations insures that the abstract analysis is a sound approximation of the concrete semantics.

This is easiest to see by studying the following picture, from which we will extract the form of the general relations:

◊latex{
    ◊document-class{preview}
    ◊use-package{tikz}
    ◊env["document"]{
        \begin{tikzpicture}[sibling distance=10em,
          every node/.style = {shape=rectangle, rounded corners,
            draw, align=center,
            top color=white, bottom color=blue!20}]]
          \node {$\bot$}
            child { node {single-line} }
            child { node {multi-line}
              child { node {$\{-1, 0\}$}
                child { node {$-1$} }
                child { node {$0$} }
            }
              child { node {aligned at}
                child { node {$-1$} }
                child { node {$0$} }
                child { node {$3$} } }
              child { node {first left,\\centered,\\last right} } };
        \end{tikzpicture}
    }
}

◊head{Shape propagation}

Our intermediate representation supports operations on arrays with static and dynamic shapes.
