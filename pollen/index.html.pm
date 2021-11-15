#lang pollen

◊(define-meta template "index-template.html")

◊section[#:id "intro"]{

    ◊headshot
    ◊div[#:class "nobreak"]{
        ◊h1{Hi, I'm McCoy!}

        ◊div[#:class "blurb"]{
        I'm currently a first year PhD student at ◊link["http://probcomp.csail.mit.edu/"]{MIT ProbComp}. 

        Previously, I worked as a research scientist at ◊link["https://beacon.bio/"]{Beacon Biosignals} and as a machine learning scientist at ◊link["https://cra.com/"]{Charles River Analytics}.
        }

        ◊div[#:class "horizontal-list"]{
            ◊link["/notebook"]{Notes} ◊link["/cv.pdf"]{CV} ◊link["https://github.com/femtomc"]{GitHub} ◊link["mailto:mccoybecker@gmail.com"]{Email}
        }
    }
}

◊section[#:id "content"]{
    ◊section[#:id "chunk"]{
        ◊h2{Research}
    }

    ◊section[#:id "block"]{
        ◊div[#:class "wide-blurb"]{
            (◊link["https://scholar.google.com/citations?user=8kaWc0EAAAAJ&hl=en"]{Google Scholar}) I've typically been interested in a connected set of technical themes:

                ◊ol{
                    ◊li{◊helio{Domain-specific language design, analysis, and optimization}}
                    ◊li{◊helio{Compiler design with domain-specific semantics}}
                    ◊li{◊helio{Compiler infrastructure development}}
                }

            I’m working on applying these themes to problems in artificial intelligence. My main focus has been probabilistic programming, but recently I’ve also begun to explore these themes in the context of automatic differentiation and programming paradigms with other unique domain semantics (like quantum computing).

            In general, I want to know how to make intelligent systems design possible, faster, and safer.
        }
    }
}

◊section[#:id "about"]{
    I created this site with ◊link["https://docs.racket-lang.org/pollen/"]{Pollen}. The source (including ◊code{*.rkt} utilities) for the site can be found ◊link["https://github.com/femtomc/pollen-website"]{here}.

    ◊b{The fonts are not free!} Please see: ◊link["https://mbtype.com/"]{Matthew Butterick's font page}.
}
