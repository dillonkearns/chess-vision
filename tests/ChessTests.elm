module ChessTests exposing (all)

import Chess exposing (Move(..))
import Expect
import Test exposing (..)


all : Test
all =
    describe "chess"
        [ describe "game"
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
            , test "knows its valid moves" <|
                \() ->
                    Chess.init
                        |> Chess.makeMove ( 2, 1 )
                        |> Chess.makeMove ( 0, 0 )
                        |> Expect.equal
                            [ ValidMove ( 0, 0 )
                            , ValidMove ( 2, 1 )
                            , ValidMove ( 0, 0 )
                            ]
            ]
        , describe "isValidMove"
            [ test "something" <|
                \() ->
                    Chess.isValidMove ( 2, 1 ) ( 0, 0 )
                        |> Expect.equal True
            , test "something else" <|
                \() ->
                    Chess.isValidMove ( 0, 0 ) ( 1, 2 )
                        |> Expect.equal True
            ]
        ]
