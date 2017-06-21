module Chess exposing (..)


type Move
    = ValidMove Coordinate
    | InvalidMove Coordinate


type alias Coordinate =
    ( Int, Int )


type alias Game =
    { moves : List Move
    , target : Coordinate
    }


init : Game
init =
    { moves = [ ValidMove ( 0, 0 ) ]
    , target = ( 4, 4 )
    }


isValidMove : Coordinate -> Coordinate -> Bool
isValidMove ( fromFile, fromRank ) ( toFile, toRank ) =
    let
        coordinateDelta =
            ( abs (toFile - fromFile)
            , abs (toRank - fromRank)
            )
    in
    coordinateDelta == ( 2, 1 ) || coordinateDelta == ( 1, 2 )


isValid : Move -> Bool
isValid move =
    case move of
        ValidMove coordinate ->
            True

        InvalidMove coordinate ->
            False


currentPosition : List Move -> Coordinate
currentPosition game =
    case game of
        (ValidMove coordinate) :: rest ->
            coordinate

        (InvalidMove coordinate) :: rest ->
            currentPosition rest

        _ ->
            Debug.crash "Impossible for list to have no ValidMove's because init seeds it with one"


lastMoveValid : List Move -> Bool
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
makeMove move ({ moves } as game) =
    let
        updatedMoves =
            if isValidMove (currentPosition moves) move then
                ValidMove move :: moves
            else
                InvalidMove move :: moves
    in
    { game | moves = updatedMoves }
