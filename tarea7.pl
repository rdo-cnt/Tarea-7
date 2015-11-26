%PRIMERO

divisible(X,Y) :- 0 is X mod Y, !.

divisible(X,Y) :- Y1 is Y+1, X > Y1, divisible(X, Y1).

primo(2) :- true,!. 
primo(X) :- X < 2,!,false.
primo(X) :- \+(divisible(X, 2)).

%SEGUNDO

primos(X, Y, [X|L]) :- X =< Y, primo(X), !, X1 is X+1, primos(X1, Y, L).
primos(X, Y, L) :- X =< Y, !, X1 is X+1, primos(X1, Y, L).
primos(_, _, []).

%TERCERO

comprime([X,Y|R], [X,Y|R1]) :- \+ X = Y, !, comprime([Y|R], [Y|R1]).
comprime([X,_|R], [X|R1]) :- !, comprime(R, R1).
comprime([X|R], [X|R1]) :- !, comprime(R, R1).
comprime([], []).

%CUARTO

%QUINTO

decodifica([[N,E]|R], L1) :- !, repite(E, N, L), decodifica(R, R1), append(L, R1, L1).
decodifica([], []).

repite(X, N, [X|R]) :- N > 0, !, N1 is N-1, repite(X, N1, R).
repite(_, 0, []).

%SEXTO

elimren(R, [X| M], [X|M1]) :- R > 1, !, R1 is R-1, elimren(R1, M, M1).
elimren(R, [_| M], M) :- R = 1, !.
elimren(R, [X|M], [X|M]) :- R < 1, !.
elimren(_, [], []).

%SEPTIMO

%OCTAVO

%NOVENO

%DECIMO