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
-export([print_helloworld/0]).

print_helloworld() ->
  io:format("Hello World ~n").