#lang pollen

/* Theorem */
.theorem {
  counter-increment: theorem;
  display: block;
  font-style: italic;
  margin-top:2rem;
  margin-left:8rem;
  width: 27rem;
  margin-bottom:2rem;
}

.theorem::before {
  content: 'Theorem ' counter(theorem) '. ';
  font-weight: bold;
  font-style: normal;
}

/* Lemma */
.lemma {
  counter-increment: theorem;
  display: block;
  font-style: italic;
  margin-top:2rem;
  margin-left:8rem;
  width: 27rem;
  margin-bottom:2rem;
}

.lemma::before {
  content: 'Lemma ' counter(theorem) '. ';
  font-weight: bold;
  font-style: normal;
}

/* Proof */
.proof {
  display: block;
  font-style: normal;
  position: relative;
  margin-top:2rem;
  margin-left:8rem;
  width: 27rem;
  margin-bottom:2rem;
}

.proof::before {
  content: 'Proof. ' attr(title);
  font-style: italic;
}

.proof:after {
  content: '◾️';
  position: absolute;
  right: -12px;
  bottom: -2px;
}

/* Definition */
.definition {
  counter-increment: definition;
  display: block;
  font-style: normal;
  margin-top:1rem;
  margin-left:8rem;
  width: 27rem;
  margin-bottom:1rem;
}

.definition::before {
  content: 'Definition ' counter(definition) '. ';
  font-weight: bold;
  font-style: normal;
}
