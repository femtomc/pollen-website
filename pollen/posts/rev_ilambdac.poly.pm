#lang pollen

◊(define-meta template "post-template.html")

◊title{Paper review: A Theory of Changes for Higher-Order Languages}

The goal of incremental computation is to reduce the cost of evaluating a function on an input ◊${I^\prime}, conditional on the fact that you may have evaluated this function before on an input ◊${I} and you know the differential ◊${I^\prime \ominus I = dI}. 

In short, you'd like to use the knowledge of the previous evaluation of the function to reduce the cost of evaluating the function on new input by updating the old result. 

How do we go about doing this and what sort of languages support this? These questions are the central concern of the paper I will review in this post.

◊folded{Paper
    ◊strong{◊em{A Theory of Changes for Higher-Order Languages - Incrementalizing ◊${\lambda}-Calculi by Static Differentiation}
    Yufei Cai, Paolo G. Giarruso, Tillman Rendel, and Klaus Ostermann
    ◊link["https://arxiv.org/abs/1312.0658"]{arXiv}
}}

◊head{The key idea}

After introducing a few examples, the authors motivate a specific mathematical concept called a ◊em{change structure}, this goes essentially as follows:

◊definition{(Change structure). A quadruple ◊${\hat{V} = (V, \Delta, \oplus, \ominus)} is a change structure for ◊${V} if the following holds:}

◊ol{
    ◊li{◊${V} is a set.}
    ◊li{Given ◊${v \in V}, ◊${\Delta v} is a set (called the ◊em{change set}).}
    ◊li{Given ◊${v \in V} and ◊${dv \in \Delta v}, ◊${v\oplus dv \in V}.}
    ◊li{Given ◊${u, \ v \in V}, ◊${u \ominus v \in \Delta v}.}
    ◊li{Given ◊${u, \ v \in V}, ◊${v \oplus (u \ominus v) = u}.}
}
