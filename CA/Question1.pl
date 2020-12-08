/*
Each number from 1 to 9 represents a different letter.   
Solve the clues and insert the letters in the appropriate squares to discover a word which uses all nine letters.

Using SWI-Prolog to compute, also works on TutorialsPoint's Online Prolog Compiler.
*/

% Question 1.1
% Membership predicates take an atom or a list of primatives.
% This allows for lists of unbound variables to be passed, as well as the atoms as described in the question.
animal_list([
    [a, a, r, d, v, a, r, k],
    [a, n, t, e, l, o, p, e],
    [c, o, y, o, t, e],
    [d, i, n, g, o],
    [d, o, n, k, e, y],
    [e, l, e, p, h, a, n, t],
    [h, o, r, s, e],
    [j, a, g, u, a, r],
    [k, a, n, g, a, r, o, o]
]).
animal(X) :-
    (
        \+ is_list(X) -> 
            spell(X, Y)
        ;
            Y = X
    ),
    animal_list(Animals),
    member(Y, Animals).

vegetable_list([
    [a, r, t, i, c, h, o, k, e], 
    [c, a, b, b, a, g, e], 
    [c, a, r, r, o, t], 
    [c, e, l, e, r, y], 
    [l, e, e, k], 
    [l, e, t, t, u, c, e], 
    [m, a, r, r, o, w], 
    [p, o, t, a, t, o], 
    [o, n, i, o, n]
]).
vegetable(X) :-
    (
        \+ is_list(X) -> 
            spell(X, Y)
        ;
            Y = X
    ),
    vegetable_list(Vegetables),
    member(Y, Vegetables).

mineral_list([
    [a, n, a, t, a, s, e], 
    [b, a, s, a, l, t], 
    [c, o, b, a, l, t], 
    [c, o, p, p, e, r], 
    [g, a, l, e, n, a], 
    [n, i, c, k, e, l], 
    [s, o, d, i, u, m], 
    [s, i, l, v, e, r], 
    [z, i, r, c, o, n]
]).
mineral(X) :-
    (
        \+ is_list(X) -> 
            spell(X, Y)
        ;
            Y = X
    ),
    mineral_list(Minerals),
    member(Y, Minerals).  

% Question 1.2
spell(A, X) :-
    atom_chars(A, X).

% Question 1.3
main :-
    Animal = [N4, N5, N2, N5, N8, N9],
    Vegetable = [N6, N5, N8, N7, N8, N5],
    Mineral = [N7, N3, N7, N8, N7, N1, N9],

    Niner = [N1, N2, N3, N4, N5, N6, N7, N8, N9],
    animal(Animal),
    vegetable(Vegetable),
    mineral(Mineral),

    atom_chars(Atom, Niner),
    write(Atom). 