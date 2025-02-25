sentence(Sentence) :-
  nounPhrase(Sentence - RemainingSentence),
  verbPhrase(RemainingSentence - []).

nounPhrase(Phrase - RemainingPhrase) :-
  article(Phrase - Whatever),
  nounExpression(Whatever - RemainingPhrase).

nounPhrase(Phrase - RemainingPhrase) :-
  nounExpression(Phrase - RemainingPhrase).

nounExpression(Expression - RemainingExpression) :-
  noun(Expression - RemainingExpression).
nounExpression(Expression - RemainingExpression) :-
  adjective(Expression - Whatever),
  nounExpression(Whatever - RemainingExpression).

verbPhrase(Phrase - RemainingPhrase) :-
  verb(Phrase - Whatever),
  nounPhrase(Whatever - RemainingPhrase).

article([the | RemainingSentence] - RemainingSentence).
article([a | RemainingSentence] - RemainingSentence).
article([an | RemainingSentence] - RemainingSentence).

adjective([big | RemainingSentence] - RemainingSentence).
adjective([small | RemainingSentence] - RemainingSentence).
adjective([brown | RemainingSentence] - RemainingSentence).
adjective([scary | RemainingSentence] - RemainingSentence).

noun([cat | RemainingSentence] - RemainingSentence).
noun([dog | RemainingSentence] - RemainingSentence).
noun([mouse | RemainingSentence] - RemainingSentence).
noun([elephant | RemainingSentence] - RemainingSentence).

verb([chases | RemainingSentence] - RemainingSentence).
verb([pets | RemainingSentence] - RemainingSentence).
verb([eats | RemainingSentence] - RemainingSentence).
verb([is | RemainingSentence] - RemainingSentence).

