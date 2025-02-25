:- dynamic((player/3, alive/1)).
:- include('Navigation.pl').
:- include('Inventory.pl').
:- include('Enemy.pl').

player('john doe', 'my house', 20).

/* This rule tells how to look about you. */

look :-
        iAmAt(Place),
        describe(Place),
        nl,
        enemyIsThere(Place),
        notice_objects_at(Place), nl,
        noticeSurrounding(Place),
        nl.

/* These rules describe the various rooms.  Depending on
   circumstances, a room may have more than one description. */

describe(Place) :- write('Your location: '), write(Place), nl.

/* These rules set up a loop to mention all the objects
   in your vicinity. */

notice_objects_at(Place) :-
        at(X, Place),
        write('There is a '), write(X), write(' here.'), nl,
        fail.

notice_objects_at(_).

noticeSurrounding(Place) :-
    path(Place, Direction, Location),
    cardinalPoint(Direction, DirectionName),
    write('There is a path to the '), write(DirectionName), write(' to '), write(Location), nl, fail.



/* This rule tells how to die. */

die :-
        finish.
