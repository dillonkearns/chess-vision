module Main exposing (main)

import Tennis
import Html exposing (..)


type Msg
    = NoOp


type alias Model =
    Tennis.Game


view : Model -> Html Msg
view model =
    div []
        [ boardView ]


board : List (List String)
board =
    List.repeat 8 (List.repeat 8 "x")


boardView : Html Msg
boardView =
    div [] (List.map rowView board)


rowView : List String -> Html Msg
rowView rowPieces =
    div [] (List.map squareView rowPieces)


squareView piece =
    text piece


init : ( Model, Cmd Msg )
init =
    Tennis.init ! []


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
