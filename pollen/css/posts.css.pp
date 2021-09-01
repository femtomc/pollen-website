#lang pollen

◊;{
  We can use the Pollen preprocessor to tidy up our CSS. 
  I’m sure I’ve missed some potential optimizations (for instance, doing math with CSS units)
}

◊(require css-tools)
◊;{
  `css-tools` is a little personal library for CSS functions. Unfortunately I haven’t yet documented it, but you can surmise what’s going on here. 
}
◊(make-media-query 24 10.5 1000 40 .25)

* {
  padding: 0;
  margin: 0;
  border: 0;
  box-sizing: border-box;
  font-weight: inherit;
  font-style: inherit;
  font-size: inherit;
  text-decoration: inherit;
  color: inherit;
}

◊(define hover-color "#fbf3f3")
◊(define link-hover-transition ◊make-css-transition["background" "0.2s"])

a:hover {
    background: ◊|hover-color|;
    ◊|link-hover-transition|
    border-radius: 8px;
}

a {
    ◊|link-hover-transition|
    text-decoration: none;
    color: #96A;
}

body {
    margin: 0;
    margin-left:auto;
    margin-right:auto;
    width:100%;
    max-width:1000px;
}

◊(define default-margin-left 8)
◊(define default-margin-right 4)
◊(define default-width 30)

#doc {
    margin-top: 6rem;
    margin-bottom: 6rem;
    ◊(make-css-kerning)
    font-family: concourse_3;
    color: #222;
    line-height: 1.4;
}

◊; This is for LaTeX-generated images.
img.latex {
    margin-top:1rem;
    margin-left:4rem;
    margin-bottom:1rem;
    max-width: 70%;
}

◊; This is for GraphViz-generated graphs.
img.dot {
    margin-top:1rem;
    margin-left:6rem;
    margin-bottom:1rem;
    max-width:50%;
}

◊; don't want to use a #doc > * selector to apply default block metrics, because it will override block-level settings (because it is more “specific” in the CSS sense)

◊(define default-horiz-block-metrics (format "
    margin-left: ~arem;
    width: ~arem;
    margin-right: ~arem;" default-margin-left default-width default-margin-right))

◊|dept-tag|.◊|dept-class| {
    ◊|default-horiz-block-metrics|
    display: block;
    font-family: advocate_ot_slab_14_cond_reg;
    ◊(make-css-ot-features '("c2sc"))
    font-size: 1rem;
    border-bottom: 1px dashed gray;
}

◊|title-tag| {
    ◊|default-horiz-block-metrics|
    font-family: heliotrope_8_caps;
    ◊(make-css-ot-features '("ss04"))
    font-size: 1.5rem;
    line-height: 1.1;
    width: 24rem;
    margin-top: 0.25rem;
    margin-bottom: 1.5rem;
}

◊|bigimage-tag|.◊|bigimage-class| {
    ◊|default-horiz-block-metrics|
    ◊(define overlap 4)
    width: ◊|(+ default-width overlap)|rem; 
    margin-left: ◊|(- default-margin-left overlap)|rem;
    margin-bottom: 1.5rem;
}

p {
  ◊|default-horiz-block-metrics|
  font-size: 1rem;
  margin-top: 0.8rem;
  margin-bottom: 0.8rem;
}

a.◊|extlink-class|:after {
    content: "\FEFF °"; 
    margin-left: 0.10em;
    font-size: 90%;
    top: -0.10em;
    color: #933;
}

a.footnote {
   text-decoration:none;
   padding-left: 2px;
   padding-right: 2px;
   margin-right: 2px;
} 

a.footnote span {
   left: 15px; 
   bottom: 20px;
   margin-left: 0px;
   margin-right: 18px;
   padding:14px 20px;
   border-radius:4px; box-shadow: 5px 5px 8px #CCC;
   border:1px solid #DCA;
}

a.footnote:hover span {
   z-index: 9;
   opacity: 1;
}

◊|code-tag|.◊|code-class|, .◊|docs-class| {
  font-family: triplicate_ot_a, Consolas, Courier;
  font-size: 0.85rem;
  background: #fafafa;
  padding: 0.1rem;
  ◊|link-hover-transition|
}

◊(define payload-color "#fdfdfd")

◊|subhead-tag|.◊|subhead-class| {
  ◊|default-horiz-block-metrics|
  ◊(make-css-ot-features '("ss04" "c2sc"))
  font-family: advocate_ot_slab_14_cond_reg, Cooper Black, Cooper Std, Rockwell Extra Bold, sans-serif;
  font-size: 1rem;
  line-height: 1.2;
  padding-top: 0.5rem;
  padding-bottom: 0.5rem;
}

◊|head-tag|.◊|head-class| {
  ◊|default-horiz-block-metrics|
  ◊(make-css-ot-features '("ss04" "c2sc"))
  font-family: advocate_ot_slab_14_cond_reg, Cooper Black, Cooper Std, Rockwell Extra Bold, sans-serif;
  font-size: 1.5rem;
  line-height: 1.2;
  padding-top: 0.7rem;
  padding-bottom: 0.3rem;
}

◊|subhead-tag|.◊|foldable-class|:after {
  content: " ⇕";
}

div.payload {
    margin-left:11rem;
    width: 24rem;
    margin-bottom:2rem;
}

.◊|payload-class| p {
  ◊; because div.payload sets the margins
  margin-left:0;
  width: inherit;
  margin-right: 0;  
}

em, .◊|deflink-class| {
  font-style: italic;
}

◊; the 'highlight' class name is hard-coded into Pygments, I’m afraid
.highlight {
    ◊|default-horiz-block-metrics|
    background: #fcfcfc;
    padding: 0.5rem;
    border-top: 1px solid #ebebeb;
    border-bottom: 1px solid #ebebeb;
    margin-bottom: 1.2rem;
}

◊|filename-tag|.◊|filename-class| {
  ◊|default-horiz-block-metrics|
  padding-bottom: 0.1rem;
  padding-top: 0.1rem;
  padding-left: 0.5rem;
  border-top-right-radius: 0.5rem;
  background: #f6f6f6;
  font-family: triplicate_ot_a, Consolas, Courier;
  font-size: 0.75rem;
  color: #666;
  position: relative;
  top: 1px;
}

.highlight .linenos {
    display: none;
}

.highlight pre {
    font-family: julia_mono;
    font-size: 0.75rem;
    line-height: 1.35;
    margin-right: -2rem;
    white-space: pre-wrap;
}

◊|title-tag|+div.highlight pre {
  font-size: 67%;
}

◊; syntax colors adapted from Racket documentation
◊define[paren-color]{#888}
◊define[comment-color]{#c2741f}
◊define[keyword-color]{#07a}
◊define[name-color]{#222}
◊define[literal-color]{#275}

◊; styling classes for Pygments
.p { color: ◊|paren-color|;}
.c { color: #998; font-style: italic; } /* Comment */
.err { color: red; font-style: italic; } /* Error */
.o { color: #000; } /* Operator */
.cm { color: ◊|comment-color|; font-style: italic } /* Comment.Multiline */
.cp { color: ◊|comment-color|; font-style: italic } /* Comment.Preproc */
.c1 { color: ◊|comment-color|; font-style: italic } /* Comment.Single */
.cs { color: ◊|comment-color|; font-style: italic } /* Comment.Special */
.gd { color: #000; background-color: #ffdddd } /* Generic.Deleted */
.ge { color: #000; font-style: italic } /* Generic.Emph */
.gr { color: #a00; } /* Generic.Error */
.gh { color: #999; } /* Generic.Heading */
.gi { color: #000; background-color: #ddffdd } /* Generic.Inserted */
.go { color: #888; } /* Generic.Output */
.gp { color: #555; } /* Generic.Prompt */
.gs { } /* Generic.Strong */
.gu { color: #aaa; } /* Generic.Subheading */
.gt { color: #a00; } /* Generic.Traceback */
.k { color: ◊|keyword-color|; } /* Keyword */
.kc { color: ◊|keyword-color|; } /* Keyword.Constant */
.kd { color: ◊|keyword-color|; } /* Keyword.Declaration */
.kn { color: ◊|keyword-color|; } /* Keyword.Namespace */
.kp { color: ◊|keyword-color|; } /* Keyword.Pseudo */
.kr { color: ◊|keyword-color|; } /* Keyword.Reserved */
.kt { color: ◊|literal-color|; } /* Keyword.Type */
.na { color: ◊|name-color|; } /* Name.Attribute */
.nb { color: ◊|keyword-color|; } /* Name.Builtin */
.nc { color: ◊|name-color|; } /* Name.Class */
.no { color: ◊|name-color|; } /* Name.Constant */
.nd { color: ◊|name-color|; } /* Name.Decorator */
.ni { color: ◊|name-color|; } /* Name.Entity */
.ne { color: ◊|name-color|; } /* Name.Exception */
.nf { color: ◊|name-color|; } /* Name.Function */
.nl { color: ◊|name-color|; } /* Name.Label */
.nn { color: ◊|name-color|; } /* Name.Namespace */
.nt { color: ◊|name-color|; } /* Name.Tag */
.nv { color: ◊|name-color|; } /* Name.Variable */
.ow { color: ◊|name-color|; } /* Operator.Word */
.w { color: #bbb; } /* Text.Whitespace */
.m { color: ◊|literal-color|; } /* Literal.Number */
.mf { color: ◊|literal-color|; } /* Literal.Number.Float */
.mh { color: ◊|literal-color|; } /* Literal.Number.Hex */
.mi { color: ◊|literal-color|; } /* Literal.Number.Integer */
.mo { color: ◊|literal-color|; } /* Literal.Number.Oct */
.s { color: ◊|literal-color|;} /* Literal.String */
.sb { color: ◊|literal-color|; } /* Literal.String.Backtick */
.sc { color: ◊|literal-color|; } /* Literal.String.Char */
.sd { color: ◊|literal-color|; } /* Literal.String.Doc */
.s2 { color: ◊|literal-color|; } /* Literal.String.Double */
.se { color: ◊|literal-color|; } /* Literal.String.Escape */
.sh { color: ◊|literal-color|; } /* Literal.String.Heredoc */
.si { color: ◊|literal-color|; } /* Literal.String.Interpol */
.sx { color: ◊|literal-color|; } /* Literal.String.Other */
.sr { color: ◊|literal-color|; } /* Literal.String.Regex */
.s1 { color: ◊|literal-color|; } /* Literal.String.Single */
.ss { color: ◊|literal-color|; } /* Literal.String.Symbol */
.bp { color: #999; } /* Name.Builtin.Pseudo */
.vc { color: #077; } /* Name.Variable.Class */
.vg { color: #077; } /* Name.Variable.Global */
.vi { color: #077; } /* Name.Variable.Instance */
.il { color: #099; } /* Literal.Number.Integer.Long */
