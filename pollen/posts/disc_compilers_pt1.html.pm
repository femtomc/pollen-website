#lang pollen

◊(define-meta template "post-template.html")

◊title{Thoughts on compilers, the first part}

◊section[#:id "block"]{
    I have a strong opinion that the more you learn about compilers, the better programmer and computer scientist you become. 

    To me, compilers are the archetypically representation of what computation is all about: accept data in one representation, transform it to another representation. This is the typical description - but I think these words do not convey the point of the process. The point being: the first representation contains some set of assumed semantics which are described by the state transitions of another system. The process makes those semantics explicit by transforming the data into a form which can be accepted as an initial configuration of the other system. If this target system is a hardware implementation of an ISA, physics takes over and (ideally) executes according to what you thought. Else, this may just be an intermediate step - a place from which further compilation can ensue!

    I think of the “semantic preserving transformation” as the core of the process. You may agree or disagree with this characterization, but I think you might agree that this characterization enjoys certain aesthetic qualities. Of course, computer hardware requires an initial configuration which it can understand. Source code from high-level languages is not that - it’s a symbolic representation which you use to abstract that low-level system. The low-level is fundamentally complex - a world of precise logic and clocks which is not necessarily intuitive, nor productive to deal with when you want to perform a specific high-level task. We must find a way to map our internal semantics onto that world. I find it strangely comforting that we can construct tools to effectively reason like this. It feels very primal - it reminds me in a very visceral way that ◊link["https://www.youtube.com/watch?v=lytxafTXg6c"]{I’m a dumb monkey}.
    
    It is very natural to build a theory of understanding on top of the set of transformations which take our etchings to the physical device level. What is easier for humans to understand? What is harder? There is quite a lot of flexibility in designing the process “take what the programmer means and execute it”. What exactly does the programmer mean? This is the hard question of programming. We are not good at expressing what we mean. That’s why programming is not a natural skill. We must force our thoughts into a restricted version with many rules - contracts with the compiler, and ultimately, the low-level system. Herein lies the frustration - when we get upset with the compiler, we say “no, I didn’t want that”. Well of course you didn’t! But you can’t express yourself as you normally would, and mistakes are likely. So we come up with ways to bring that level of expression closer to what we understand.

    Compilers have existed throughout human history. We just didn’t call them compilers. Any abstraction which eases the task of our primitive thinking box has the potential to be a front end for a compiler. Human organizations (frighteningly) resemble a type of compiler. Large scale engineering efforts also seem to resemble compilers. It’s irrepressibly difficult for human beings to understand and control complex systems. So we come up with ways to abstract from the complexity. We come up with a representation of the device semantics and we agree to contractual rules which we constrain our thinking with. This is a fundamental aspect of our reasoning in the face of complexity - in our attempts to control complex systems.

    I think what most excites me about this perspective is that we’re just beginning to understand it. Formal representation of compilers is very new in human history. We’ve just begun to explore implementations, we’ve just begun to explore languages (like: category theory) for describing these processes. I think as long as human beings must think, must reason in the face of complexity which is overwhelming, the study of programming languages and compilers will thrive. This study is uniquely human - it deals fundamentally with our limitations, with our mistakes. It also deals fundamentally with how we compress knowledge for future generations - what is the best way to transmit the processes by which we reason about complexity to future humanity. This study is also uniquely suited to tell us more about ourselves, about why we think the way we do. Common abstractions which are widely appreciated are highly powerful statements about human intuition and aesthetics.
}
