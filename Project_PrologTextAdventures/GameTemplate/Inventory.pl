:- include('World.pl').
:- dynamic(holding/1).

/* These rules describe how to pick up an object. */

take(X) :-
        holding(X),
        write('You''re already holding it!'),
        !, nl.

take(X) :-
        iAmAt(Place),
        at(X, Place),
        retract(at(X, Place)),
        asserta(holding(X)),
        write('👍 OK.'),
        !, nl.

take(_) :-
        write('💩 I don''t see it here.'),
        nl.


/* These rules describe how to put down an object. */

drop(X) :-
        holding(X),
        iAmAt(Place),
        retract(holding(X)),
        asserta(at(X, Place)),
        write('👍 OK.'),
        !, nl.

drop(_) :-
        write('😢 You aren''t holding it!'),
        nl.

inventory :-
        holding(_),
        write('You are holding: '), nl,
        listAllPossessions, !.

inventory :- write('🚫 You have no inventory').

listAllPossessions :-
        holding(X),
        write(X), nl,
        fail.

listAllPossessions.
