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
-export([push/2, pop/1, add/1, mul/1, sub/1, division/1, toNegative/1]).

push(X, Stack) ->
  lists:append([X], Stack).
pop(Stack) ->
  [First|Retail] = Stack,
  {First, Retail}.
add(Stack) ->
  {N1, S1} = pop(Stack),
  {N2, S2} = pop(S1),
  push(N1 + N2, S2).
mul(Stack) ->
  {N1, S1} = pop(Stack),
  {N2, S2} = pop(S1),
  push(N1 * N2, S2).
sub(Stack) ->
  {N1, S1} = pop(Stack),
  {N2, S2} = pop(S1),
  push(N2 - N1, S2).
division(Stack) ->
  {N1, S1} = pop(Stack),
  {N2, S2} = pop(S1),
  push(N2 / N1, S2).
toNegative(Stack) ->
  {N, S} = pop(Stack),
  push(-N, S).
