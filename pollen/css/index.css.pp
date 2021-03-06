#lang pollen

body {
    font-size: 1.2em;
    font-family: concourse_3;
    text-rendering: optimizeLegibility;
    font-feature-settings: 'kern' 1;
    margin: 0 auto 2em auto;
    max-width:800px;
    line-height: 1.6em;
}

#intro {
    padding: 1em;
}

#content {
    padding: 0.5em 1.2em 0.5em 1.2em;
}

#about {
    margin-left:2em;
    margin-right:2em;
    padding-left: 1.2em;
    padding-right: 1.2em ;
    border: 1px solid #ccc;
    border-radius: 16px;
}

#chunk {
    padding-top:10px;
}

#block {
    padding-top: 10px;
    padding-left: 2%;
    padding-right: 2%;
    padding-bottom: 20px;
}

#posts-content {
    padding: 0.5em 1.2em 0.5em 1.2em;
    font-size: 1.1em;
}

#intro img.headshot {
    margin: 0em 1em 2em 0;
    float: left;
    border-radius: 50%;
    width: 12.1em;
    display: none;
}

#intro .horizontal-list {
    word-spacing: 15px;
    max-width: 80%;
    margin-top: 1em;
}

h2 {
    font-family: century_supra_ot_a;
    margin-top: 0.4em;
    padding-bottom: 0px;
    font-size: 1.6em;
    text-transform: lowercase;
    text-align: center;
    letter-spacing: 0.2vw;
    background: #a4a4a4;
    padding: 2%;
    border-radius: 16px;
    color: #f5f5f5;
}

#block ol, #posts-content ol {
    font-family: concourse_index;
    word-spacing: 2px;
    color: black;
    margin-left: 8%;
}

#block .title {
    position:relative;
    left:10%;
    max-width:40%;
}

#block .wide-blurb {
    margin-left:5%;
    max-width: 90%;
}

#block .force-helio {
    font-family: concourse_3;
}

a {
    font-family: concourse_3;
    text-decoration: none;
    color: #96A;
}

a:hover {
    transition: 0.3s;
    background: rgba(100, 100, 255, 0.1);
}

@media (max-width:768px) {
    #intro .headshot {
        display: none;
    }
}
