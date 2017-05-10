module Chess exposing (..)


type Move
    = ValidMove Coordinate
    | InvalidMove Coordinate


type alias Coordinate =
    ( Int, Int )


type alias Game =
    List Move


init : Game
init =
    [ ValidMove ( 0, 0 ) ]


isValidMove : Coordinate -> Coordinate -> Bool
isValidMove from to =
    if to == ( 2, 1 ) then
        True
    else
        False


isValid : Move -> Bool
isValid move =
    case move of
        ValidMove coordinate ->
            True

        InvalidMove coordinate ->
            False


currentPosition : Game -> Coordinate
currentPosition game =
    let
        move =
            game
                |> List.filter isValid
                |> List.head
                |> Maybe.withDefault (ValidMove ( -1000, -1000 ))
    in
        case move of
            ValidMove coordinate ->
                coordinate

            InvalidMove _ ->
                ( -1000, -1000 )


lastMoveValid : Game -> Bool
lastMoveValid game =
    case game of
        lastMove :: allOtherMoves ->
            case lastMove of
                ValidMove _ ->
                    True

                _ ->
                    False

        _ ->
            False


makeMove : Coordinate -> Game -> Game
makeMove move game =
    if isValidMove (currentPosition game) move then
        ValidMove move :: game
    else
        InvalidMove move :: game
