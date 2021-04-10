% See https://en.wikipedia.org/wiki/Fibonacci_number

fibonacci(A, B) :-
    fibonacci(A, 1, 1, B).

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
case(fibonacci(13, _)).
case(fibonacci(65, _)).

test :-
    writeln('# running fibonacci.pl'),
    case(A),
    A,
    writeln(A),
    fail.
test :-
    nl,
    halt.
