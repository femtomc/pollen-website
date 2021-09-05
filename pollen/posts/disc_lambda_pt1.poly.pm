#lang pollen

◊(define-meta template "post-template.html")

◊title{The untyped lambda calculus}

The untyped ◊${\lambda}-calculus is a dense representation of universal computation. In untyped form, the lambda calculus consists of symbolic terms built from the following objects:

◊folded{Variable
◊$${x, y, z...}
An identifier representing a mathematical or logical value.
}

◊folded{Lambda abstraction
◊$${(\lambda \ x. M)}
◊${M} is called a lambda term. The notation ◊${\lambda \ x.(...)} means that ◊${x} is bound in the ◊${M} term.

Together, with application, this allows the definition and application of procedures.
}

◊folded{Application
◊$${(M N)}
Apply a function to an argument. ◊${M} and ◊${N} are both lambda terms.
}

With a suitably defined evaluation semantics (e.g. how terms transformation / reduce to other terms) - this language (plus semantics) is Turing complete, which means it can be used to simulate any Turing machine, including ◊link["https://en.wikipedia.org/wiki/Universal_Turing_machine"]{a universal one}.

◊head{Application}

We have to give application a transformation semantics - which means we need to define what it means for the term ◊${M} to apply to ◊${N} in the application term ◊${(M N)}.

To get a feel for this question, let's study some lambda abstraction terms.

◊align{&\lambda \ x. x \\ 
       &\lambda \ x. \lambda \ y. (x \ y)}

Now, we can immediately identify a rule: we can rename bound variables as long as we do so consistently throughout a lambda term.

◊folded{Alpha conversion
◊$${\lambda \ x . x \rightarrow \lambda \ y . y}

The name representation of bound variables can be changed as long as the change is applied consistently throughout a ◊${\lambda}-term.}

Let's also consider a rule which allows us to define a transformation semantics for application: when applying a ◊${\lambda}-term to another term ◊${N} - all occurrences of the outermost bound variable in ◊${M} are replaced by ◊${N}.

◊folded{Beta reduction
◊$${(M(x) \ N) \rightarrow M[x \rightarrow N]}

Here, the notation ◊${M(x)} denotes that ◊${x} is bound in the term ◊${M}. The ◊${\beta-\text{reduction}} rule says "replace all occurrences of ◊${x} in ◊${M} with ◊${N}".}

Why do we need ◊${\alpha}-conversion at all? To avoid ambiguity, if I want to substitute a term ◊${N} into ◊${M} via ◊${\beta}-reduction - to avoid namespace collisions, I may have to rename bound variables / free variables in ◊${N}.

◊subhead{Evaluation order}

There's actually one more form of ambiguity which we need to handle with a rule - this form of ambiguity arises when considering the evaluation order of subterms in an application term.


◊dot{
v1[image="◊inline-math->ref{\lambda}",label=""];
v2[image="◊inline-math->ref{\lambda}",label=""];
v1->v2;
}

◊head{Interpreter}

◊deflink["https://github.com/femtomc/untyped-lambda"]{Source code for the interpreter is available here.}

In a language like Haskell (with algebraic data types) - we can swiftly construct an interpreter for the untyped lambda calculus, as long as we agree upon an evaluation order. Let's begin with a data type for terms:

◊highlight['haskell]{
data Term = Var String
          | Lam Var Term
          | App Term Term
}

Now, as mentioned above - we can construct lambda abstractions with whatever bound / free variable names we want - but when we choose to perform ◊${\beta}-reduction, we will need to identify if there are collisions and apply ◊${\alpha}-conversion.

◊${\alpha}-conversion need only apply when looking at ◊code{App Term Term}.

◊highlight['haskell]{
alpha_conv :: Term -> Term
alpha_conv Var s = Var s
alpha_conv Lam v t = Lam v t
alpha_conv App t1 t2 = let names = get_names t1 in
    App t1 $ rename t2 names
}

Here, we just pass through variable and lambda terms - but in application, we grab all the bound and free variables of the first term and ensure that the second term has no collisions.
