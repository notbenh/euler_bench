#!/usr/bin/env escript

main(_) ->
    Sum = lists:sum([ X || X <- lists:seq(1,999),
                           X rem 3 == 0 orelse X rem 5 == 0]),
    io:format("~p~n", [Sum]).
