#lang pollen

◊(define-meta template "post-template.html")

◊title{Discussions on cognitive science: concepts and cognitive science}

Here's a notepad of my thoughts on a piece by Stephen Laurence and Eric Margolis called ◊em{Concepts and Cognitive Science}.

Immediately, I'm interested in one specific question:

◊quoted{Are concepts mental representations, or might they be abstract entities?}

I like to think that my evolving perspective on these topics is more mathematically oriented. In my head, the notion of a mental representation is like a specific state of a cognitive system -- and this is very concrete. It could be represented at different levels, by neurons, or by activation patterns of large neural circuits. That's why phrases like "abstract entities" makes me queasy -- it seems really not concrete. What is an "abstract entity" with respect to a specific physiological state? I'm not sure.

Next is an interesting block where (L + M) discuss compositionality of lexical concepts into more complex (what I will call) memes - e.g. phrases or composed concepts:

◊quoted{For a variety of reasons, most discussions of concepts have centered around lexical concepts. Lexical concepts are concepts like BACHELOR, BIRD, and BITE - roughly, ones that correspond to lexical items in natural languages.
One reason for the interest in lexical concepts is that it's common to think that words in natural languages inherit their meanings from the concepts they are used to express. 

In some discussions, concepts are taken to be just those mental representations that are expressed by words in natural languages. However, this usage is awkward, since it prohibits labeling as concepts those representations that are expressed by complex natural language expressions. One wouldn't be able to say, for example, that the concept BLACK CAT (corresponding to the English expression "black cat") is composed of the simpler concepts BLACK and CAT; only the latter would be concepts. Yet most of the reasons that one would have to single out BLACK and CAT and the like as concepts apply equally to complexes that have these as their constituents. 

There may be little difference between lexical concepts and other complex concepts apart from the fact that the former are lexicalized; indeed, on many views, lexical concepts are themselves complex representations. At the same time, it seems wrong to designate as concepts mental representations of any size whatsoever. Representations at the level of complete thoughts - that is, ones that may express whole propositions - are too big to be concepts. Accordingly, we will take concepts to be subpropositional mental representations.}

I'm not really sure I agree with (L + M) - they don't really offer any compelling evidence, other than this sort of ad hoc argument that you can't represent phrases using the same mechanism. Without really understanding how they are thinking about mental representations, I'm not sure what can be said further. For example, I could easily think about a finite-state automata which changes representations depending on receiving multiple words in succession. Thinking about the state representation for a simple automata like this - a single word could prime the state representation, for which the second word produces a new transition.

Despite my feelings about the above, I agree with the last paragraph - possibly there is a certain "size" of representation (e.g. neural circuit activation?) which denote primitive concepts? This feels right - but I don't have evidence to back this up. Honestly, this whole notion of the mind reflecting the discreteness of language makes me uneasy.

Skipping ahead a bit, (L + M) proceed to cover ◊em{the classical theory of concepts}:

◊quoted{In one way or another, most theories of concepts can be seen as reactions to, or developments of, what is known as the Classical Theory of Concepts. The Classical Theory holds that most concepts - especially lexical concepts - have definitional structure. What this means is that most concepts encode necessary and sufficient conditions for their own application.

According to the Classical Theory, we can think of this concept as a complex mental representation that specifies necessary and sufficient conditions for something to be a bachelor. So BACHELOR might be composed of a set of representations such as Is NOT MARRIED, IS MALE, and Is AN ADULT. Each of these components specifies a condition that something must meet in order to be a bachelor, and anything that satisfies them all thereby counts as a bachelor. These components, or features, yield a semantic interpretation for the complex representation in accordance with the principles of a compositional semantics.}

I think there are clear issues with this theory - in my opinion, the most prominent is the subjectivity of concept. The viewpoint expressed above is highly logical, and being logical, should apply universality across mental representations. Of course, individuals have different boundaries for concepts - and this theory does not cover this subjective nature.

(L + M) also make this comment:

◊quoted{On the Classical Theory, most concepts-including most lexical concepts-are complex representations that are composed of structurally simpler representations. What's more, it's natural to construe their structure in accordance with the Containment Model, where the components of a complex concept are among its proper parts.

Some of these components may themselves be complex, as in the case of BACHELOR. But eventually one reaches a level of primitive representations, which are undefined. Traditionally, these primitive representations have been taken to be sensory or perceptual in character, along broadly empiricist lines.}

which raises an excellent point - assuming reduction to primitive concepts, any proponent of this theory must further describe ◊em{where the primitive concepts come from}. Are they formed by evolution? Are they perceptual? If they are perceptual, how do lexical concepts ◊em{with structure} arise from perceptual ones?

(L + M) go on to discuss how this theory handles the acquisition of concepts:

◊quoted{If a concept is a complex representation built out of features that encode necessary and sufficient conditions for its application, then the natural model of concept acquisition is one where the learner acquires a concept by assembling its features. If, in accordance with the empiricist version of the Classical Theory, we add the further stipulation that primitive features are sensory or perceptual, the model we arrive at is something like the following. Through perception, sensory properties are monitored so that their representations are joined in a way that reflects environmental contingencies. Having noticed the way these properties correlate in her environment, the learner assembles a complex concept that incorporates the relevant features in such a way that something falls under the new, complex concept just in case it satisfies those features. In this way, all concepts in the end would be defined in terms of a relatively small stock of sensory concepts.}
