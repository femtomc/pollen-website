#lang pollen

◊(define-meta template "post-template.html")

◊title{Intuitions behind the awkward squad: functors, applicatives, and monads}

Functors, applicatives, and monads lie at the core of genericity in Haskell (and a few other functional languages). "Why?" is an excellent question.

Mostly, it turns out that a type system based on System F admits these type-level constructs - and they turn out to be a convenient way to organize code patterns which operate across multiple pieces of data. In addition, with type classes (a form of ad hoc polymorphism) - definitions for the type class interfaces can be extended onto new pieces of data. This allows us to reason about the behavior of data through these interfaces - the type classes themselves.

Thus, when Haskellers say "functorial programming" or "programming in a monadic style" - it's actually very specific. It's very reminiscient of the Linus Torvalds quote: "Bad programmers worry about the code. Good programmers worry about data structures and their relationships" - of course he likely wasn't referring to a language like Haskell in this case. However, the same intuition holds true. Extending the one of the above three type classes says something very specific about the capabilities of the data type in question, and also provides a ground to reason about how to work on that data.

So what is a functor? Basically, it's a type class whose data type instances implement a "flat map"-like function which allows us to ignore the internal structure and treat it like mapping over a list.

◊highlight['haskell #:line-numbers? #f]{
class Functor f where
    fmap :: (a -> b) -> f a -> f b
}

So instancing this type class for your data means that you have to define ◊code{fmap} - but you can't just define any version of ◊code{fmap} which type checks: there are a set of laws which ◊code{fmap} must follow which are not checked by GHC, but are based on mathematical considerations from category theory.

Now, one very natural thing you might want to do is extend the arity of ◊code{fmap} - e.g.

◊highlight['haskell]{
fmap1 :: (a -> b -> c) -> f a -> f b -> f c
}

One thing we can do is define the following interface
◊highlight['haskell]{
class Applicative f where
    <*> :: f (a -> b) -> f a -> f b
    pure :: a -> f a
}
