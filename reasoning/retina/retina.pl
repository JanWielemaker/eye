% -------------------------------------------------
% Retina to support directed chaining -- Jos De Roo
% -------------------------------------------------

:- op(1150,xfx,'-:').

:- dynamic('-:'/2).
:- dynamic(goal/0).
:- dynamic(label/1).
:- dynamic(lus/1).

retina :-
    (Prem -: Conc),
    call(Prem),
    \+call(Conc),
    (   Conc = goal
    ->  !
    ;   labelvars(Conc),
        % emulating logical update semantics
        assertz(lus(Conc)),
        retract(goal),
        fail
    ).
retina :-
    (   goal
    ->  !
    ;   % emulating logical update semantics
        forall(retract(lus(C)),astep(C)),
        assertz(goal),
        retina
    ).

labelvars(Term) :-
    (   label(Current)
    ->  true
    ;   Current = 0
    ),
    numbervars(Term,Current,Next),
    retractall(label(_)),
    assertz(label(Next)).

astep((A,B)) :-
    !,
    astep(A),
    astep(B).
astep(A) :-
    (   \+call(A)
    ->  assertz(A)
    ;   true
    ).
