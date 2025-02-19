:- dynamic(at/2).

location('my house').
location(garden).
location('resident street').
location('front of neighbor 1 house').
location('neighbor 1 house').
location('front of neighbor 2 house').
location('neighbor 2 house').
location('main street').
location('police station').
location(supermarket).
location(park).
location(school).

path('my house', s, garden).
path(garden, s, 'resident street').
path('resident street', e, 'front of neighbor 1 house').
path('front of neighbor 1 house', s, 'neighbor 1 house').
path('front of neighbor 2 house', e, 'resident street').
path('front of neighbor 2 house', s, 'neighbor 2 house').
path('front of neighbor 1 house', e, 'main street').

path(From, n, To) :- path(To, s, From).
path(From, w, To) :- path(To, e, From).

at(thing, garden).
at(anotherthing, 'my house').
