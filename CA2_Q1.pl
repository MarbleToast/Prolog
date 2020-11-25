/*
Each number from 1 to 9 represents a different letter.   
Solve the clues and insert the letters in the appropriate squares to discover a word which uses all nine letters.
*/

% Question 1.1
animal_list([aardvark, antelope, coyote, dingo, donkey, elephant, horse, jaguar, kangaroo]).
animal(X) :-
    animal_list(Animals),
    member(X, Animals).

vegetable_list([artichoke, cabbage, carrot, celery, leek, lettuce, marrow, potato, onion]).
vegetable(X) :-
    vegetable_list(Vegetables),
    member(X, Vegetables).

mineral_list([anatase, basalt, cobalt, copper, galena, nickel, sodium, silver, zircon]).
mineral(X) :-
    mineral_list(Minerals),
    member(X, Minerals).  

% Question 1.2
spell(A, X) :-
    atom_chars(A, X).

% Question 1.3
animal_clue(452859).
vegetable_clue(658785).
mineral_clue(7378719).

key_value(K, M, V):- member(K-V, M).

get_values([], []).
get_values([_-Value|Tail1], [Value|Tail2]) :-
        get_values(Tail1, Tail2).

map_char_to_num(I, O) :- 
    (
        \+is_list(I) ->
        spell(I, L)
    ;
        L = I
    ),
    map_char_to_num(L, [], O).

map_char_to_num([], _, []).
map_char_to_num([H1|T1], M ,[H2|T2]) :-
    ( 
        length(M, 0) ->
        append([H1-0], M, M2),
        H2 is 0

    ;   key_value(H1, M, V) ->
        H2 is V,
        M2 = M
     
    ;   get_values(M, Values),
        max_list(Values, Max),
        NewMax is Max + 1,
        append([[H1-NewMax], M], M2),
        H2 is NewMax
    ),
    map_char_to_num(T1, M2, T2).

isEqual(X, Y) :- X == Y.

get_matches(Clue, Words, Match) :-
    maplist(map_char_to_num, Words, Codes),
    map_char_to_num(Clue, ClueCode),
    include(isEqual(ClueCode), Codes, CodeMatches),
    nth0(0, CodeMatches, CodeMatch),
    nth0(CodeIndex, Codes, CodeMatch),
    nth0(CodeIndex, Words, Match).
    
main :- 
    vegetable_list(Vegetables),
    animal_list(Animals),
    mineral_list(Minerals),

    animal_clue(AC),
    vegetable_clue(VC),
    mineral_clue(MC),

    get_matches(VC, Vegetables, VegMatch),
    get_matches(AC, Animals, AniMatch),
    get_matches(MC, Minerals, MinMatch),

    writeln([VegMatch, AniMatch, MinMatch]). 

    
    

    

    



