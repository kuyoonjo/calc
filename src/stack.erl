%%%-------------------------------------------------------------------
%%% @author yuchen
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 13. Jan 2015 10:46 AM
%%%-------------------------------------------------------------------
-module(stack).
-author("yuchen").

%% API
-export([push/2, pop/1, addition/1, multiplication/1, subtraction/1, division/1, negation/1]).

push(X, Stack) ->
  lists:append([X], Stack).
pop(Stack) ->
  [First|Remain] = Stack,
  {First, Remain}.
addition(Stack) ->
  {N1, S1} = pop(Stack),
  {N2, S2} = pop(S1),
  push(N1 + N2, S2).
multiplication(Stack) ->
  {N1, S1} = pop(Stack),
  {N2, S2} = pop(S1),
  push(N1 * N2, S2).
subtraction(Stack) ->
  {N1, S1} = pop(Stack),
  {N2, S2} = pop(S1),
  push(N2 - N1, S2).
division(Stack) ->
  {N1, S1} = pop(Stack),
  {N2, S2} = pop(S1),
  push(N2 / N1, S2).
negation(Stack) ->
  {N, S} = pop(Stack),
  push(-N, S).
