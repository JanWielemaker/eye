% See https://en.wikipedia.org/wiki/Fibonacci_number

fibonacci(A, B) :-
    fibonacci(A, 0, 1, B).

fibonacci(0, _, A, A).
fibonacci(1, _, A, A).
fibonacci(A, B, C, D) :-
    A > 1,
    E is A-1,
    F is B+C,
    fibonacci(E, C, F, D).

% test cases
case(fibonacci(0, _)).
case(fibonacci(1, _)).
case(fibonacci(6, _)).
case(fibonacci(91, _)).
case(fibonacci(283, _)).
case(fibonacci(3674, _)).

test :-
    case(A),
    A,
    write('[] :scryer-result "'),
    write(A),
    write('".'),
    nl,
    fail.
test :-
    halt.