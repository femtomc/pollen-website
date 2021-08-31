#lang pollen

◊(define-meta template "index-template.html")

◊section[#:id "content"]{
    ◊section[#:id "chunk"]{
        ◊h2{Posts}
    }
}

◊section[#:id "posts-content"]{
    ◊section[#:id "block"]{
        ◊ol{
            ◊li{◊link["/posts/disc_compilers_pt1.html"]{Thoughts on compilers, the first part}}
        }
    }
}
