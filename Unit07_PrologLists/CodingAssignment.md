# IF.05.22 Theoretical Informatics 2017

## Objective
The goal of this assignment is to train recursion and lists in PROLOG.

## Materials
- gProlog
- An editor

## Required Tasks
1. Implement the clauses `prependElement/3` and `appendElement/3`. The first adds an element `E` in front of a list `L` whereas the latter appends an element at the end of a list.
2. Implement a clause `hasLength/2` which calculates the length of a list.
3. Implement a clause `removeElement/3` which removes an element `E` from a list `L`.
4. Implement the clause `removeDuplicates/2` which removes all duplicate elements of a list

## Hints
- `appendElement/3` works very similar to `concatenate/3` as given in the tutorial [RecursionAndLists](RecursionAndLists.md).
- `hasLength/2` needs the built-in PROLOG predicate `is/2`. `N is X + 1` is true if `N` has the value of `X + 1` and is false otherwise.
- One can think about `removeElement/3` as we thought about `isMember` in the [tutorial](RecursionAndLists.md):
   - If `E` is the head of `L` then the result is the tail of `L`.
   - If `E` is in the tail of `L` we must remove `E` from the tail of `L`.
- Another way to think about `removeElement/3` would be to consider it as the reversion of `addElement/3` (`ReducedTail` instead of `ExtendedTail`).
- `removeDuplicates/2` is an extension to `removeElement`. Using the clause `isMember/2` from the tutorial might be a good way to think of.


## Things to Learn
- PROLOG Lists
- Recursion

## Evaluation
Do all the required tasks and make a pull request. If you make a pull request, you might have to chance to present your solution in our next training unit.
