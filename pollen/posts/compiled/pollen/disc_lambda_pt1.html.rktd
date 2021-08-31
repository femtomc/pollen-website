((3) 0 () 0 () () (u . "<!DOCTYPE html>\n<html>\n  <head>\n    <meta charset=\"UTF-8\">\n    <title>The untyped lambda calculus</title>\n    <script id=\"MathJax-script\" async src=\"https://cdn.jsdelivr.net/npm/mathjax@3.0.1/es5/tex-mml-chtml.js\">\n    </script>\n    <script type=\"text/javascript\">\n    function toggle_div(id) {\n        e = document.getElementById(id);\n        if (e.style.display == 'block') {\n            e.style.display = 'none';\n        }\n        else if (e.style.display == 'none') {\n            e.style.display = 'block';\n        }\n    }\n    </script>\n    <link rel=\"stylesheet\" type=\"text/css\"\n          media=\"all\" href=\"../css/posts.css\"/>\n    <link rel=\"stylesheet\" type=\"text/css\"\n          media=\"all\" href=\"../css/fonts.css\"/>\n</head>\n    <body>\n    <div id=\"doc\"><h1>The untyped lambda calculus</h1><p>The untyped <mathjax>\\(\\lambda\\)</mathjax>-calculus is a dense representation of universal computation. In untyped form, the lambda calculus consists of symbolic terms built from the following objects:</p><h3 class=\"subhead foldable\"><a href=\"javascript:toggle_div('g25214')\">Variable</a></h3><div style=\"display:none;\" id=\"g25214\" class=\"payload\"><p><mathjax>\\begin{equation}x, y, z...\\end{equation}</mathjax><br/>An identifier representing a mathematical or logical value.</p></div><h3 class=\"subhead foldable\"><a href=\"javascript:toggle_div('g25215')\">Lambda abstraction</a></h3><div style=\"display:none;\" id=\"g25215\" class=\"payload\"><p><mathjax>\\begin{equation}(\\lambda \\ x. M)\\end{equation}</mathjax><br/><mathjax>\\(M\\)</mathjax> is called a lambda term. The notation <mathjax>\\(\\lambda \\ x.(...)\\)</mathjax> means that <mathjax>\\(x\\)</mathjax> is bound in the <mathjax>\\(M\\)</mathjax> term.</p><p>Together, with application, this allows the definition and application of procedures.</p></div><h3 class=\"subhead foldable\"><a href=\"javascript:toggle_div('g25216')\">Application</a></h3><div style=\"display:none;\" id=\"g25216\" class=\"payload\"><p><mathjax>\\begin{equation}(M N)\\end{equation}</mathjax><br/>Apply a function to an argument. <mathjax>\\(M\\)</mathjax> and <mathjax>\\(N\\)</mathjax> are both lambda terms.</p></div><p>With a suitably defined evaluation semantics (e.g. how terms transformation / reduce to other terms) - this language (plus semantics) is Turing complete, which means it can be used to simulate any Turing machine, including <a href=\"https://en.wikipedia.org/wiki/Universal_Turing_machine\">a universal one</a>.</p><h2 class=\"head\">Application</h2><p>We have to give application a transformation semantics - which means we need to define what it means for the term <mathjax>\\(M\\)</mathjax> to apply to <mathjax>\\(N\\)</mathjax> in the application term <mathjax>\\((M N)\\)</mathjax>.</p><p>To get a feel for this question, let’s study some lambda abstraction terms.</p><p><mathjax>\\begin{align}&amp;\\lambda \\ x. x \\\\\n&amp;\\lambda \\ x. \\lambda \\ y. (x \\ y)\\end{align}</mathjax></p><p>Now, we can immediately identify a rule: we can rename bound variables as long as we do so consistently throughout a lambda term.</p><h3 class=\"subhead foldable\"><a href=\"javascript:toggle_div('g25217')\">Alpha conversion</a></h3><div style=\"display:none;\" id=\"g25217\" class=\"payload\"><p><mathjax>\\begin{equation}\\lambda \\ x . x \\rightarrow \\lambda \\ y . y\\end{equation}</mathjax></p><p>The name representation of bound variables can be changed as long as the change is applied consistently throughout a <mathjax>\\(\\lambda\\)</mathjax>-term.</p></div><p>Let’s also consider a rule which allows us to define a transformation semantics for application: when applying a <mathjax>\\(\\lambda\\)</mathjax>-term to another term <mathjax>\\(N\\)</mathjax> - all occurrences of the outermost bound variable in <mathjax>\\(M\\)</mathjax> are replaced by <mathjax>\\(N\\)</mathjax>.</p><h3 class=\"subhead foldable\"><a href=\"javascript:toggle_div('g25218')\">Beta reduction</a></h3><div style=\"display:none;\" id=\"g25218\" class=\"payload\"><p><mathjax>\\begin{equation}(M(x) \\ N) \\rightarrow M[x \\rightarrow N]\\end{equation}</mathjax></p><p>Here, the notation <mathjax>\\(M(x)\\)</mathjax> denotes that <mathjax>\\(x\\)</mathjax> is bound in the term <mathjax>\\(M\\)</mathjax>. The <mathjax>\\(\\beta-\\text{reduction}\\)</mathjax> rule says “replace all occurrences of <mathjax>\\(x\\)</mathjax> in <mathjax>\\(M\\)</mathjax> with <mathjax>\\(N\\)</mathjax>”.</p></div><p>Why do we need <mathjax>\\(\\alpha\\)</mathjax>-conversion at all? To avoid ambiguity, if I want to substitute a term <mathjax>\\(N\\)</mathjax> into <mathjax>\\(M\\)</mathjax> via <mathjax>\\(\\beta\\)</mathjax>-reduction - to avoid namespace collisions, I may have to rename bound variables / free variables in <mathjax>\\(N\\)</mathjax>.</p><h3 class=\"subhead\">Evaluation order</h3><p>There’s actually one more form of ambiguity which we need to handle with a rule - this form of ambiguity arises when considering the evaluation order of subterms in an application term.</p><p><img class=\"latex\" src=\"compiled/images/latex_1143290705308394075.png\"/></p><h2 class=\"head\">Interpreter</h2><p><span class=\"defined-term\"><a href=\"https://github.com/femtomc/untyped-lambda\" class=\"ext\">Source code for the interpreter is available here.</a></span></p><p>In a language like Haskell (with algebraic data types) - we can swiftly construct an interpreter for the untyped lambda calculus, as long as we agree upon an evaluation order. Let’s begin with a data type for terms:</p><div class=\"highlight\"><table class=\"sourcetable\"><tbody><tr><td class=\"linenos\"><div class=\"linenodiv\"><pre><span class=\"normal\">1</span>\n<span class=\"normal\">2</span>\n<span class=\"normal\">3</span></pre></div></td><td class=\"code\"><div class=\"source\"><pre><span></span><span class=\"kr\">data</span> <span class=\"kt\">Term</span> <span class=\"ow\">=</span> <span class=\"kt\">Var</span> <span class=\"kt\">String</span>\n          <span class=\"o\">|</span> <span class=\"kt\">Lam</span> <span class=\"kt\">Var</span> <span class=\"kt\">Term</span>\n          <span class=\"o\">|</span> <span class=\"kt\">App</span> <span class=\"kt\">Term</span> <span class=\"kt\">Term</span>\n</pre></div></td></tr></tbody></table></div><p>Now, as mentioned above - we can construct lambda abstractions with whatever bound / free variable names we want - but when we choose to perform <mathjax>\\(\\beta\\)</mathjax>-reduction, we will need to identify if there are collisions and apply <mathjax>\\(\\alpha\\)</mathjax>-conversion.</p><p><mathjax>\\(\\alpha\\)</mathjax>-conversion need only apply when looking at <span class=\"my-code\" decode=\"exclude\">App Term Term</span>.</p><div class=\"highlight\"><table class=\"sourcetable\"><tbody><tr><td class=\"linenos\"><div class=\"linenodiv\"><pre><span class=\"normal\">1</span>\n<span class=\"normal\">2</span>\n<span class=\"normal\">3</span>\n<span class=\"normal\">4</span>\n<span class=\"normal\">5</span></pre></div></td><td class=\"code\"><div class=\"source\"><pre><span></span><span class=\"nf\">alpha_conv</span> <span class=\"ow\">::</span> <span class=\"kt\">Term</span> <span class=\"ow\">-&gt;</span> <span class=\"kt\">Term</span>\n<span class=\"nf\">alpha_conv</span> <span class=\"kt\">Var</span> <span class=\"n\">s</span> <span class=\"ow\">=</span> <span class=\"kt\">Var</span> <span class=\"n\">s</span>\n<span class=\"nf\">alpha_conv</span> <span class=\"kt\">Lam</span> <span class=\"n\">v</span> <span class=\"n\">t</span> <span class=\"ow\">=</span> <span class=\"kt\">Lam</span> <span class=\"n\">v</span> <span class=\"n\">t</span>\n<span class=\"nf\">alpha_conv</span> <span class=\"kt\">App</span> <span class=\"n\">t1</span> <span class=\"n\">t2</span> <span class=\"ow\">=</span> <span class=\"kr\">let</span> <span class=\"n\">names</span> <span class=\"ow\">=</span> <span class=\"n\">get_names</span> <span class=\"n\">t1</span> <span class=\"kr\">in</span>\n    <span class=\"kt\">App</span> <span class=\"n\">t1</span> <span class=\"o\">$</span> <span class=\"n\">rename</span> <span class=\"n\">t2</span> <span class=\"n\">names</span>\n</pre></div></td></tr></tbody></table></div><p>Here, we just pass through variable and lambda terms - but in application, we grab all the bound and free variables of the first term and ensure that the second term has no collisions.</p></div>\n</body>"))