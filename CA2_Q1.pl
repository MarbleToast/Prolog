/* Question 1.1 */
animal_list([aardvark, antelope, coyote, dingo, donkey, elephant, horse, jaguar, kangaroo]).
animal(X) :-
    member(X, animal_list(A)).
    
vegetable_list([artichoke, cabbage, carrot, celery, leek, lettuce, marrow, potato, onion]).
vegetable(X) :-
    member(X, vegetable_list(V)).

mineral_list([anatase, basalt, cobalt, copper, galena, nickel, sodium, silver, zircon]).
mineral(X) :-
    member(X, mineral_list(M)).  

/* Question 1.2 */
spell(A, X) :-
    atom_chars(A, X).

animal_clue(452859).
vegetable_clue(658785).
mineral_clue(7378719).

main :- .
    

    



