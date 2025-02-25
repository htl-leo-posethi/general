# Unit 8 - Programming Text Adventures in Prolog

## Random Numbers
- Initialize the random number generator by calling `randomize/1` at the beginning of a program
- `random/3` generates a random number. In particular `random(Base, Limit, Number)` tries to unify `Number` such that it is between `Base` and `Limit`.

## Arithmetic
- To "assign" a value to a variable we use `is/2`. You should be already familiar with. `X is N1 + N2` succeeds if it can unify `X` with `N1 + N2`. Of course, other expressions than `+` could be used.
-  `=:=/2` checks whether two expressions are equal. `RandomNumber =:= 2` succeeds if `RandomNumber` is equal to `2`. Analogously the following predicates can be used:
   -  `=\=` for unequal
   -  `<` for smaller
   -  `<=` for at most
   -  `>=` for at least
   -  `>` for greater

## Other Stuff
- Emojis: https://1000logos.net/emoji-copy-and-paste/