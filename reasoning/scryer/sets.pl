% See original code at https://samples.jbpub.com/9780763772062/PrologLabBook09.pdf

% facts
p(0, 1).
p(0, 2).
p(1, 3).
p(2, 4).

% test cases
case(findall(p(X, Y), p(X, Y), _F)).
% _S = {x | ∃y p(x, y)} = {0, 1, 2}.
case(setof(X, Y^p(X, Y), _S)).
% _S = {x | ∃y p(x, y)} = {1, 2}.
case(setof(X, p(0, X), _S)).
% _S = {g(x, y) | ∃z (p(x, z) ∧ p(z, y))} = {g(0, 3), g(0, 4)}.
case(setof(g(X, Y), Z^(p(X, Z), p(Z, Y)), _S)).

test :-
    case(A),
    A,
    write('[ :scryer-statement "'),
    write(A),
    write('"].'),
    nl,
    fail.
test :-
    halt.