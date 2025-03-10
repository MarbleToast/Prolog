/*
Each number from 1 to 9 represents a different letter.   
Solve the clues and insert the letters in the appropriate squares to discover a word which uses all nine letters.

Using SWI-Prolog to compute.
*/

% Question 2.1

unique([]).
unique([H|T]) :- \+ member(H, T), unique(T).

divide_list(L, A, B) :-
    append(A, B, L),
    length(A, N),
    length(B, N).

par(N):-
    atom_chars(N, Nc),
    length(Nc, 4),
    unique(Nc),
    \+ member('0', Nc),
    divide_list(Nc, H, T),
    atom_chars(Ha, H),
    atom_number(Ha, Hi),
    atom_chars(Ta, T),
    atom_number(Ta, Ti),
    0 is Hi mod Ti.
    
% Question 2.2
pars(PARS):- 
    numlist(1234, 9876, I),
    include(par, I, PARS).
    
party(P1, P2) :-
    par(P1),
    par(P2),
    atom_chars(P1, P1c),
    atom_chars(P2, P2c),
    append([P1c, P2c], Pc),
    unique(Pc),
    maplist(atom_number, Pc, Pn),
    sumlist(Pn, Sum),
    Missing = 45 - Sum,
    0 is P1 mod Missing,
    0 is P2 mod Missing.

partys(PARTYS):- 
    pars(PARS),
    findall(X-Y, (append(_,[X|R], PARS), member(Y,R)), Pairs),
    findall([X, Y], (member(X-Y, Pairs), party(X, Y)), PARTYS).