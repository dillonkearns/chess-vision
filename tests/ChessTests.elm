module ChessTests exposing (all)

import Test exposing (..)
import Expect
import Chess


all : Test
all =
    describe "Chess"
        [ test "init has a knight in the top left corner" <|
            \() ->
                Chess.init
                    |> Expect.equal ( 0, 0 )
        , test "make move moves knight to new square" <|
            \() ->
                Chess.init
                    |> Chess.makeMove ( 7, 7 )
                    |> Expect.equal ( 7, 7 )
        ]
