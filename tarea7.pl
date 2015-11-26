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

codifica([X|R], L) :- !, cuenta(1, [X|R], L).
codifica([], []).

cuenta(N, [X,Y|R], A) :- X = Y, !, N1 is N+1, cuenta(N1, [Y|R], A).
cuenta(N, [X|R], [[N,X]|L]) :- codifica(R, L).

%QUINTO

decodifica([[N,E]|R], L1) :- !, repite(E, N, L), decodifica(R, R1), append(L, R1, L1).
decodifica([], []).

repite(X, N, [X|R]) :- N > 0, !, N1 is N-1, repite(X, N1, R).
repite(_, 0, []).

%SEXTO

elimren(R, [X| M], [X|M1]) :- R > 1, !, R1 is R-1, elimren(R1, M, M1).
elimren(1, [_| M], M) :- !.
elimren(R, [X|M], [X|M]) :- R < 1, !.
elimren(_, [], []).

%SEPTIMO

elimcol(C, [X| M], [X1|M1]) :- !, elimren(C, X, X1), elimcol(C, M, M1).
elimcol(_, [], []).

%OCTAVO

esarbol(a(_, I, D)) :- !, esarbol(I), esarbol(D).
esarbol(nil). 

%NOVENO

internos(a(R, I, D), [R|X]) :- (\+ I = nil; \+ D = nil), !, internos(I, IX), internos(D, DX), append(IX, DX, X). 
internos(_, []).

%DECIMO

balanceado(N, a(x, I, D)) :- N>1, 0 is N mod 2, !, N2 is N//2, N1 is N2-1, ((balanceado(N1, I), balanceado(N2, D); balanceado(N2, I), balanceado(N1, D))).
balanceado(N, a(x, I, D)) :- N>1, !, N1 is N//2, balanceado(N1, I), balanceado(N1, D).
balanceado(1, a(x,nil,nil)).
balanceado(0, nil).
