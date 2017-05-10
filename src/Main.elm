module Main exposing (main)

import Chess
import Html exposing (..)
import Html.Attributes exposing (class, style)
import Html.Events exposing (onClick)
import SquaresToIterate


type Msg
    = MakeMove ( Int, Int )


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
    div [ style [ ( "font-size", "60px" ), ( "cursor", "hand" ) ] ] (List.map (squareView game) rowPieces)


squareView : Chess.Game -> ( Int, Int ) -> Html Msg
squareView game piece =
    let
        madeValidMove =
            Chess.lastMoveValid game

        squareValue =
            if (Chess.currentPosition game) == piece then
                "♞"
            else
                "◻️"
    in
        if madeValidMove then
            span [ onClick (MakeMove piece) ] [ (text squareValue) ]
        else
            span [ style [ ( "color", "red" ) ], onClick (MakeMove piece) ] [ (text squareValue) ]


init : ( Model, Cmd Msg )
init =
    Chess.init ! []


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        MakeMove toSquare ->
            (model |> Chess.makeMove toSquare) ! []


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , update = update
        , subscriptions = \_ -> Sub.none
        , view = view
        }
