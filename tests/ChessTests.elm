module ChessTests exposing (all)

import Test exposing (..)
import Expect
import Chess exposing (Move(..))


all : Test
all =
    describe "Chess"
        [ test "init has a knight in the top left corner" <|
            \() ->
                Chess.init
                    |> Expect.equal [ ValidMove ( 0, 0 ) ]
        , test "records valid move" <|
            \() ->
                Chess.init
                    |> Chess.makeMove ( 2, 1 )
                    |> Expect.equal [ ValidMove ( 2, 1 ), ValidMove ( 0, 0 ) ]
        , test "records invalid move" <|
            \() ->
                Chess.init
                    |> Chess.makeMove ( 7, 7 )
                    |> Expect.equal [ InvalidMove ( 7, 7 ), ValidMove ( 0, 0 ) ]
        ]
