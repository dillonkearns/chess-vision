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
                        |> Expect.equal
                            { moves = [ ValidMove ( 0, 0 ) ]
                            , target = ( 4, 4 )
                            }
            , test "records valid move" <|
                \() ->
                    Chess.init
                        |> Chess.makeMove ( 2, 1 )
                        |> .moves
                        |> Expect.equal [ ValidMove ( 2, 1 ), ValidMove ( 0, 0 ) ]
            , test "records invalid move" <|
                \() ->
                    Chess.init
                        |> Chess.makeMove ( 7, 7 )
                        |> .moves
                        |> Expect.equal [ InvalidMove ( 7, 7 ), ValidMove ( 0, 0 ) ]
            , test "knows its valid moves" <|
                \() ->
                    Chess.init
                        |> Chess.makeMove ( 2, 1 )
                        |> Chess.makeMove ( 0, 0 )
                        |> .moves
                        |> Expect.equal
                            [ ValidMove ( 0, 0 )
                            , ValidMove ( 2, 1 )
                            , ValidMove ( 0, 0 )
                            ]
            ]
        , describe "isValidMove"
            [ test "move down two & over one" <|
                \() ->
                    Chess.isValidMove ( 2, 1 ) ( 0, 0 )
                        |> Expect.equal True
            , test "move over two & up one" <|
                \() ->
                    Chess.isValidMove ( 0, 0 ) ( 1, 2 )
                        |> Expect.equal True
            ]
        ]
