%%%-------------------------------------------------------------------
%%% @author yuchen
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Jan 2015 11:07 AM
%%%-------------------------------------------------------------------
-module(main).
-author("yuchen").

%% API
-export([evaluate/1]).

evaluate(RPN) ->
  evaluate(RPN, []).
evaluate([], [Output|_]) ->
  Output;
evaluate(RPN, Stack) ->
  [First|Retail] = RPN,
  case First of
    {number, Number} ->
      evaluate(Retail, stack:push(Number, Stack));
    {operator, "+"} ->
      evaluate(Retail, stack:add(Stack));
    {operator, "-"} ->
      evaluate(Retail, stack:sub(Stack));
    {operator, "*"} ->
      evaluate(Retail, stack:mul(Stack));
    {operator, "/"} ->
      evaluate(Retail, stack:division(Stack));
    {operator, "~"} ->
      evaluate(Retail, stack:toNegative(Stack))
  end.
