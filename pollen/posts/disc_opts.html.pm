#lang pollen

◊(define-meta template "post-template.html")

◊title{A small guide to SSA-based compiler optimizations}

The middle phases of the compiler are where a lot of magic happens. For imperative languages, the representation
of source code at this stage is usually in static single assignment form - a beneficial representation which allows computation of useful topological properties of the source program's call and control flow graphs.

◊folded{Static single assignment form
}

Information like dominators and the dominator tree facilitate transformations which reduce code size, eliminate unnecessary runtime execution, reduce pressure on runtime elements (like a garbage collector) before the code is further lowered and linked towards a piece of target hardware.

Below, I'll cover a relatively standard set of optimizations.

◊head{Inlining}

Call site (or block) inlining is a transformation which reduces the size of the program's call graph by merging nodes together. Consider the following pseudo IR:

◊highlight['haskell]{
foo: (%1, %2, %3)
    %4 = some_call(%2, %3)
    %5 = some_other_call(%4, %3)
    return %5
}

◊head{Scalar replacement of aggregates}

◊head{Loop-invariant code motion}

Loop-invariant code motion is mostly what it sounds like: moving statements outside of control flow when they do not affect the runtime semantics of the program.

This is very generic - but considering this example:

◊highlight['c]{
void f(int x) {
    int i = 0;
    int n = 50;
    while(i < 50){
        x = x + n;
        y = x;
    }
}
}

◊head{Dead code elimination}
◊head{Common subexpression elimination}
◊head{Instruction combining}
◊head{Loop unrolling}
