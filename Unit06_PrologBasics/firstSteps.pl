/* Simple prolog clauses to get a first impression */

croaks(fritz).
croaks(berta).
croaks(kermit).
eatsFlies(fritz).
eatsFlies(berta).
eatsFlies(kermit).

chirps(burli).
chirps(heidi).
chirps(mia).
sings(burli).
sings(heidi).
sings(mia).

isFemale(berta).
isFemale(heidi).
isFemale(mia).
isMale(X) :- \+ isFemale(X).

color(fritz, green).
color(berta, green).
color(kermit, brown).
color(burli, green).
color(heidi, yellow).
color(mia, blue).

isFrog(X) :- croaks(X), eatsFlies(X). % the first rule
isCanary(X) :- chirps(X), sings(X).

isSameSpecies(X, Y) :- (isFrog(X), isFrog(Y) ; isCanary(X), isCanary(Y)).
doLookAlike(X, Y) :- isSameSpecies(X, Y),
    color(X, C1), color(Y, C2), 
    C1 = C2,
    X \= Y.

canMate(X, Y) :- (isFrog(X), isFrog(Y) ; isCanary(X), isCanary(Y)) , X \= Y.
hasDifferentSex(X, Y) :- isFemale(X), isMale(Y).
canReproduce(X, Y) :- canMate(X, Y), hasDifferentSex(X, Y).