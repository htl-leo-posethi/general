:- dynamic((player/3, alive/1)).

:- include('Navigation.pl').
:- include('Inventory.pl').
:- include('Enemy.pl').

player('john doe', 'my house', 20).

/* This rule tells how to look around you. */
look :- iAmAt(Place), describeCurrentSituation(Place).

describeCurrentSituation(Place) :-
    describe(Place), nl,
    noticeObjectsAt(Place), nl,
    noticeSurrounding(Place), nl.

/* These rules describe the various rooms.  Depending on
   circumstances, a room may have more than one description. */

describe(Place) :- format("Your location: ~w.~n", [Place]).

/* These rules set up a loop to mention all the objects
   in your vicinity. */

noticeObjectsAt(Place) :-
        at(X, Place),
        describeObject(X),
        fail.

noticeObjectsAt(_).

describeObject(enemy(Icon, Enemy, Health, Strength)) :-
    !,
    format("~w 🛑:  A ~w with health ~w and strength ~w is approaching you!~n", [Icon, Enemy, Health, Strength]).

describeObject(X) :- format("There is a ~w here.~n", [X]).

noticeSurrounding(Place) :-
    path(Place, Direction, Location),
    cardinalPoint(Direction, DirectionName),
    format("There is a path to the ~w to ~w.~n", [DirectionName, Location]),
    fail.

/* This rule tells how to die. */

die :-
        finish.
