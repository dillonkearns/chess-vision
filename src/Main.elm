module Main exposing (main)

import Chess
import Html exposing (..)
import SquaresToIterate


type Msg
    = NoOp


type alias Model =
    Chess.Game


view : Model -> Html Msg
view model =
    div []
        [ boardView model ]


boardView : Chess.Game -> Html Msg
boardView game =
    div [] (List.map (rowView game) SquaresToIterate.squaresToIterate)


rowView : Chess.Game -> List ( Int, Int ) -> Html Msg
rowView game rowPieces =
    div [] (List.map (squareView game) rowPieces)


squareView : Chess.Game -> ( Int, Int ) -> Html msg
squareView game piece =
    if game == piece then
        text "n"
    else
        text "x"


init : ( Model, Cmd Msg )
init =
    Chess.init ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }
