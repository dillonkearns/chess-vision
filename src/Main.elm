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
        []


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
