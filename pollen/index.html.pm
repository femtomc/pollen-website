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
        ◊link["braindump"]{Braindump} ◊link["https://github.com/femtomc"]{GitHub} ◊link["mailto:mccoybecker@gmail.com"]{Email}
        }
    }
}

◊section[#:id "content"]{
    ◊section[#:id "chunk"]{
        ◊h2{Research}
    }

    ◊section[#:id "block"]{
        ◊div[#:class "wide-blurb"]{
            (◊link["https://scholar.google.com/citations?user=8kaWc0EAAAAJ&hl=en"]{Google Scholar}) I'm interested in a connected set of technical themes:

                ◊ol{
                    ◊li{◊helio{Domain-specific language design, analysis, and optimization}}
                    ◊li{◊helio{PL/SE perspectives on artificial intelligence}}
                    ◊li{◊helio{Performance engineering in probabilistic programming}}
                }

            I'm working on these themes with ◊link["http://probcomp.csail.mit.edu/"]{my lab colleagues at MIT}, advised by ◊link["http://probcomp.csail.mit.edu/principal-investigator/"]{Vikash K. Mansingkha}.
        }
    }
}

◊section[#:id "about"]{
    I created this site with ◊link["https://docs.racket-lang.org/pollen/"]{Pollen}. The source (including ◊code{*.rkt} utilities) for the site can be found ◊link["https://github.com/femtomc/pollen-website"]{here}.

    ◊b{The fonts are not free!} Please see: ◊link["https://mbtype.com/"]{Matthew Butterick's font page}.
}
