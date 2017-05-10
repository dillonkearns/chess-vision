module Chess exposing (..)


type alias Game =
    ( Int, Int )


init : Game
init =
    ( 0, 0 )


makeMove : ( Int, Int ) -> Game -> Game
makeMove move game =
    move
