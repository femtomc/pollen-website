#lang pollen

◊(define-meta template "index-template.html")

◊section[#:id "content"]{
    ◊section[#:id "chunk"]{
        ◊h2{Posts}
    }
    ◊section[#:id "posts-content"]{
        ◊ol{
            ◊li{◊link["/posts/disc_cogsci_prep_sept1.html"]{Discussions on cognitive science: representation and computation}}
            ◊li{◊link["/posts/disc_compilers_pt1.html"]{Thoughts on compilers, the first part}}
        }
    }
}

