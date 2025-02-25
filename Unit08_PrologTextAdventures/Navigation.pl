iAmAt(Location) :- player('john doe', Location, _).

newLocation(Location) :-
    player('john doe', _, CurrentHealth),
    retract(player(_, _, _)),
    asserta(player('john doe', Location, CurrentHealth)).

/* These rules define the direction letters as calls to go/1. */

n :- go(n).

s :- go(s).

e :- go(e).

w :- go(w).


/* This rule tells how to move in a given direction. */

go(Direction) :-
        iAmAt(Here),
        path(Here, Direction, There),
        newLocation(There),
        !, look.

go(_) :-
        write('You can''t go that way.').
