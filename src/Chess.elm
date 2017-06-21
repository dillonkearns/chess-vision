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
isValidMove ( fromFile, fromRank ) to =
    let
        validToCoordinates =
            [ ( fromFile + 2, fromRank + 1 )
            , ( fromFile + 2, fromRank - 1 )
            , ( fromFile - 2, fromRank + 1 )
            , ( fromFile - 2, fromRank - 1 )
            , ( fromFile + 1, fromRank + 2 )
            , ( fromFile + 1, fromRank - 2 )
            , ( fromFile - 1, fromRank - 2 )
            , ( fromFile - 1, fromRank + 2 )
            ]
    in
    validToCoordinates |> List.member to


isValid : Move -> Bool
isValid move =
    case move of
        ValidMove coordinate ->
            True

        InvalidMove coordinate ->
            False


currentPosition : Game -> Coordinate
currentPosition game =
    case game of
        (ValidMove coordinate) :: rest ->
            coordinate

        (InvalidMove coordinate) :: rest ->
            currentPosition rest

        _ ->
            Debug.crash "Impossible for list to have no ValidMove's because init seeds it with one"


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
