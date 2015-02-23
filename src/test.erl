%%%-------------------------------------------------------------------
%%% @author yuchen
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. Jan 2015 2:18 PM
%%%-------------------------------------------------------------------
-module(test).
-author("yuchen").

%% API
-export([test/0]).

test() ->
  EXP1 = "12+34*5/6",
  EXP2 = "(12+34)*5/6",
  EXP3 = "~(12+34)*5/6",
  EXP4 = "12+34*~5/6",
  RPN1 = rpn:parse(EXP1),
  RPN2 = rpn:parse(EXP2),
  RPN3 = rpn:parse(EXP3),
  RPN4 = rpn:parse(EXP4),
  CODE1 = main:compile(RPN1),
  CODE2 = main:compile(RPN2),
  CODE3 = main:compile(RPN3),
  CODE4 = main:compile(RPN4),
  io:fwrite("~s = ~p~n", [EXP1, main:evaluate(RPN1)]),
  io:fwrite("~s~n RPN -> ~p~n CODE -> ~p~n->~p~n~n", [EXP1,RPN1,CODE1, main:simulate(CODE1)]),
  io:fwrite("~s = ~p~n", [EXP2, main:evaluate(RPN2)]),
  io:fwrite("~s~n RPN -> ~p~n CODE -> ~p~n->~p~n~n", [EXP2,RPN2,CODE2, main:simulate(CODE2)]),
  io:fwrite("~s = ~p~n", [EXP3, main:evaluate(RPN3)]),
  io:fwrite("~s~n RPN -> ~p~n CODE -> ~p~n->~p~n~n", [EXP3,RPN3,CODE3, main:simulate(CODE3)]),
  io:fwrite("~s = ~p~n", [EXP4, main:evaluate(RPN4)]),
  io:fwrite("~s~n RPN -> ~p~n CODE -> ~p~n->~p~n~n", [EXP4,RPN4,CODE4, main:simulate(CODE4)]),
  ok.
