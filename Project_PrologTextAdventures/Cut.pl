/* If X >= Y, choose X and cut (so it won't try any other clauses). */
max(X, Y, X) :-
    X >= Y, !.

/* If the above fails or doesn't apply, choose Y. */
max(X, Y, Y).
