%%%-------------------------------------------------------------------
%%% @author yuchen
%%% @copyright (C) 2015, <COMPANY>
%%% @doc
%%%
%%% @end
%%% Created : 12. Jan 2015 11:28 AM
%%%-------------------------------------------------------------------
-module(rpn).
-author("yuchen").

%% API
-export([parse/1]).

parse({[], [], Output}) ->
  Output;
parse({[], Stack, Output}) ->
  [H|T] = Stack,
  parse({[], T, lists:append(Output, [H])});
parse({Resource, Stack, Output}) ->
  First = string:sub_string(Resource, 1, 1),
  [_|T] = Resource,
  case First of
    "(" ->
      parse({T, lists:append([{bracket, left}], Stack), Output});
    ")" ->
      matchBrackets(T, Stack, Output);
    Else ->
      C = isOperator(Else),
      if
        C ->
          addOperator(T, Stack, Output, {operator, Else});
        true ->
          {Number, Remain} = string:to_integer(Resource),
          parse({Remain, Stack, lists:append(Output, [{number, Number}])})
      end
  end;
parse(Resource) ->
  parse({Resource, [], []}).

isOperator("+") ->
  true;
isOperator("-") ->
  true;
isOperator("*") ->
  true;
isOperator("/") ->
  true;
isOperator("~") ->
  true;
isOperator(_) ->
  false.
precedence(X) ->
  case X of
    {operator, "+"} -> 1;
    {operator, "-"} -> 1;
    {operator, "*"} -> 2;
    {operator, "/"} -> 2;
    {operator, "~"} -> 3;
    _ -> 0
  end.
addOperator(Resource, [], Output, Operator) ->
  parse({Resource, [Operator], Output});
addOperator(Resource, Stack, Output, Operator) ->
  [Top|Remain] = Stack,
  C = precedence(Operator) > precedence(Top),
  if
    Top == {bracket, left} ->
      parse({Resource, lists:append([Operator], Stack), Output});
    C ->
      parse({Resource, lists:append([Operator], Stack), Output});
    true ->
      addOperator(Resource, Remain, lists:append(Output, [Top]), Operator)
  end.

matchBrackets(Resource, Stack, Output) ->
  [Top|Remain] = Stack,
  case Top of
    {bracket, left} ->
      parse({Resource, Remain, Output});
    Else ->
      matchBrackets(Resource, Remain, lists:append(Output, [Else]))
  end.


