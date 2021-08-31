<!DOCTYPE html>
<html>
  <head>
    <meta charset="UTF-8">
    <title>◊(select 'h1 here)</title>
    <script id="MathJax-script" async src="https://cdn.jsdelivr.net/npm/mathjax@3.0.1/es5/tex-mml-chtml.js">
    </script>
    <script type="text/javascript">
    function toggle_div(id) {
        e = document.getElementById(id);
        if (e.style.display == 'block') {
            e.style.display = 'none';
        } 
        else if (e.style.display == 'none') {
            e.style.display = 'block';
        } 
    }
    </script>
    <link rel="stylesheet" type="text/css" 
          media="all" href="../css/posts.css"/>
    <link rel="stylesheet" type="text/css" 
          media="all" href="../css/fonts.css"/>
</head>
    <body>
    ◊(->html #:tag 'div #:attrs '((id "doc")) doc)
</body>
