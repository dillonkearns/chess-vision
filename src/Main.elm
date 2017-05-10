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
        [ boardView ]


board : List (List String)
board =
    List.repeat 8 (List.repeat 8 "x")


boardView : Html Msg
boardView =
    div [] (List.map rowView SquaresToIterate.squaresToIterate)


rowView : List ( Int, Int ) -> Html Msg
rowView rowPieces =
    div [] (List.map squareView rowPieces)


squareView : ( Int, Int ) -> Html msg
squareView piece =
    text <| toString piece


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
