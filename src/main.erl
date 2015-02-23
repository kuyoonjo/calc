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
-export([evaluate/1, compile/1, simulate/1]).

evaluate(RPN) ->
  simulate(compile(RPN)).

compile(RPN) ->
  compile(RPN, []).
compile([], Output) ->
  lists:append(Output, [{return}]);
compile(RPN, Output) ->
  [First|Remain] = RPN,
  case First of
    {number, Number} ->
      compile(Remain, lists:append(Output, [{push, {number, Number}}]));
    {operator, "+"} ->
      compile(Remain, lists:append(Output, [{addition}]));
    {operator, "-"} ->
      compile(Remain, lists:append(Output, [{subtraction}]));
    {operator, "*"} ->
      compile(Remain, lists:append(Output, [{multiplication}]));
    {operator, "/"} ->
      compile(Remain, lists:append(Output, [{division}]));
    {operator, "~"} ->
      compile(Remain, lists:append(Output, [{negation}]))
  end.

simulate(CODE) ->
  simulate(CODE, []).
simulate(CODE, Stack) ->
  [First|Remain] = CODE,
  case First of
    {push, {number, Number}} ->
      simulate(Remain, stack:push(Number, Stack));
    {addition} ->
      simulate(Remain, stack:addition(Stack));
    {subtraction} ->
      simulate(Remain, stack:subtraction(Stack));
    {multiplication} ->
      simulate(Remain, stack:multiplication(Stack));
    {division} ->
      simulate(Remain, stack:division(Stack));
    {negation} ->
      simulate(Remain, stack:negation(Stack));
    {return} ->
      [Output|_] = Stack,
      Output
  end.

