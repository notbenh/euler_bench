#!/usr/bin/env escript

main(_) ->
    Sum = do_sum(0, 0),
    io:format("~p~n", [Sum]).

do_sum(1000, Acc) -> Acc;
do_sum(N, Acc) ->
    NewAcc =
        case N of
            M when M rem 3 == 0 -> Acc + N;
            M when M rem 5 == 0 -> Acc + N;
            _ -> Acc
        end,
    do_sum(N+1, NewAcc).


