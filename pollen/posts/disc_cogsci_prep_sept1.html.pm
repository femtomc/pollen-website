#lang pollen

◊(define-meta template "post-template.html")

◊title{Discussions on cognitive science: representation and computation}

I'm hoping to attend a course on development psychology this term - and for the first class, I've been asked to brainstorm why cognitive science needs the theoretical constructs of ◊em{mental representation} and ◊em{mental computation}. The below is the result of my brainstorming.

◊head{Inspiration from physics}

I have an opinion that cognitive science has borrowed much inspiration from physics which I wanted to explore. In the context of physics, representation and dynamics (e.g. time evolution under a Hamiltonian) is mostly everything (seriously). Because physics has successfully described the natural phenomenon that we experience, it seems plausible that applying the same techniques to the study of cognition might lead to similar success. In particular, we might borrow the same vernacular: considering ◊em{states} and ◊em{transformations} on states.

I will not argue about the content of representations in physics, suffice it to say that different base representations can lead to drastically different theories (think: N-dimensional Euclidean space, Hilbert space, even differentiable manifolds which are locally Minkowski).

Instead, I'd like to focus in on the usage of ◊em{computation} in ◊em{mental computation} - which invokes a stronger relationship with the dynamics described by information theory, and (in the context of physics), something like the study of natural computation or quantum computation.

One abstract viewpoint on these two terms can be obtained by reverting to descriptions which utilize state and transformations. This is very simple, abstract, and encompasses both physical systems with differentiable dynamics as well as the symbolic systems most often encountered in computer science.

◊head{A study of state and transformation?}

Continuing with this thought, we might approach cognitive science by considering our objects of study: states and transformations. Taking inspiration from ◊link["https://www.nature.com/articles/s41593-018-0200-7"]{Friston's theory of predictive coding}, we might consider state to be generalized across mind and environment. So a state is a product space ◊${(S, E)} where ◊${S} characterizes the mind, and ◊${E} characterizes the environment. I think this characterization adequately captures something important - cognitive systems can only exhibit ◊em{intelligent or cognitive behavior} with respect to some environment!

Now, what is mental about the above representation? I think this question motivates the introduction of ◊em{mental computations} as reasoning about transformations on the product space ◊${(S, E)}. 

Subsystems which operate within ◊${(S, E)} can interact with ◊${E} through some set of parameters ◊${\theta}. This gives rise to a partial DAG model of interaction

◊dot{
ep[image="◊inline-math->ref{E_{prev}}", label=""];
en[image="◊inline-math->ref{E_{next}}", label=""];
S;
ep->en;
S->en;
}

where ◊${E_{next} \sim P(E_{next} | E_{prev}, \theta_{prev})}.

This encapsulates the discussion above - the environment has some transition function, which includes the interaction with the cognitive system through ◊${\theta}. The next state is drawn from a distribution which is dependent on ◊${\theta_{prev}} - how the system expresses its desire and intent on the environment.

Cognitive systems will reasoning about the transition function, as well as the effect of ◊${\theta} on the transition function. This implies a DAG model of interaction which includes reflective reasoning on the transition ◊${P(E_{next} | E_{prev}, \theta_{prev})}.

◊dot{
ep[image="◊inline-math->ref{E_{prev}}", label=""];
en[image="◊inline-math->ref{E_{next}}", label=""];
ep->en;
ep->O;
O->S;
S->S;
S->en;
}

where ◊${O\sim P(O | E_{prev})} represents a noisy observation of the state of the environment.

◊head{Reflection necessary for cognition?}

I think this highlights an important difference between non-cognitive systems and cognitive ones - non-cognitive systems do not reflectively reason about the transition. They simply reason about ◊${S}, and produce ◊${\theta}, ignoring information about the current state of the environment. Finite state machines are good examples of this - irrespective of setting the initial configuration of the FSM, the FSM will transition according to its own rules, ignoring anything else outside of the FSM.

In contrast, cognitive systems reason about the transition of the product space ◊${(S, E)} before producing ◊${\theta} - this can involve internal state representations of ◊${E} (which I'll call ◊${S_E}) and simulated transformations of the state using the surrogate ◊${S_E}. This gives rise to planning, for example.

◊head{Summary}

This mostly summarizes my thoughts on these terms. For non-cognitive systems (like FSMs, as mentioned above), I think one can avoid introducing these concepts into study. However, cognitive systems which have ◊em{intent} and express actions with the purpose of influencing the transition function require a mechanism which allows for reflective reasoning about the transition, and associated representations of the environment to reason over. 

Even now, in artificial intelligence, we see these concepts reflected - e.g. deep reinforcement learning algorithms produce internal representations which are reasoned over before action selection from a policy. Although I would argue that reflective reasoning about the transition is sometimes missing in these algorithms - they still seem to perform well, especially in environments without noisy observations, although they certainly lack the abilities attributed to robust learners like people.
