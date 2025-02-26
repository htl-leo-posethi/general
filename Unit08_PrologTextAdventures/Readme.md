# Unit 8 - Programming Text Adventures in Prolog
## Playing Around
```
cd GameTemplate
gprolog
| ?- placeEnemyAt('myHouse').
yes
| ?- look.
```
## Separating the Source Base
In order to structure the source base it is possible to separate the code into different files. To include the content of a file into another file the predicate `include/1` is used. Example:

```Prolog
:- include('Library.pl').
```
This command replaces the above given line by the source text of `Library.pl`. This is similar as the `#include <...>` you know from C. Take care that Prolog does not provide a mechanism to prevent multiple includes. One has to track this manually.

## Debugging
The more complex programs grow the more important is to see how they are executed. Prolog can be turned into debugging mode by calling the predicate `trace/0`. In this mode the execution of predicates is shown step by step. Next step is shown by hitting return. A debug run of a predicate can be aborted by hitting `a`.

To turn off debugging mode the predicate `notrace/0` must be called.

## Managing Data aka Dynamic Predicates
We have seen that a Prolog program is a logicbase of predicates, and so far we have entered clauses for those predicates directly in our programs. Prolog also allows us to manipulate the logicbase directly and provides built-in predicates to perform this function. The main ones are:

**asserta(X):** Adds the clause X as the first clause for its predicate. Like the other I/O predicates, it always fails on backtracking and does not undo its work.

**assertz(X):** Same as asserta/1, only it adds the clause X as the last clause for its predicate.

**retract(X):** Removes the clause X from the logicbase, again with a permanent effect that is not undone on backtracking.

As an example we want to show the predicate `setNewLocation/1` which removes the player from his old location and puts them to the new location as given in the predicate's argument. We assume a predicate `player(playerName, Location, CurrentHealth)` which tries to unify `Location` and `CurrentHealth` with the current parameters of `playerName`.

```Prolog
:- dynamic(player/3).

setNewLocation(Location) :-
    player('john doe', _, CurrentHealth), % get values of player
    retract(player(_, _, _)), % remove current definition of player
    asserta(player('john doe', Location, CurrentHealth)). % add definition of player with new location
```
Note that we have to declare the predicate `player/3` to be dynamic (first line) to be able to use `asserta/1`, `assertz/1` or `retract/1`.

## Fail

## Cut
Sometimes it is desirable to selectively turn off backtracking. Prolog provides a predicate that performs this function. It is called the cut, represented by an exclamation mark (!).

The cut effectively tells Prolog to freeze all the decisions made so far in this predicate. That is, if required to backtrack, it will automatically fail without trying other alternatives.

As an example we want to consider the following implementation of the predicate `max/3`:

```Prolog
max(X, Y, X) :-
    X >= Y.

max(X, Y, Y).
```
When querying `max(3, 5, Z).` no harm can be detected since the first definition fails (`X >= Y` fails and therefore the whole predicate fails). Due to backtracking the second definition is called which gives the expected result.

`max(5, 3, Z).` however behaves harmfully. We get the correct result `Z = 5` (by evaluating the first definition) but it keeps stuck in backtracking and also evaluates the second definition which results in `Z = 3` which does not make sense.

In this case we have to prevent Prolog from backtracking which is done by the cut. We end up in a definition as shown in [Cut.pl](./Cut.pl).

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
### Emojis
... can be found under: https://1000logos.net/emoji-copy-and-paste/

### Formatted Output
Instead of consecutive calls of `write/1` it is more convenient to use the pre-defined `format/2` clause. `format("~w and ~w are forbidden to take~n", [Object1, Object2])` is equivalent to

```Prolog
write(Object1), write(' and '), write(Object2),
write(' are forbidden to take'), nl
```