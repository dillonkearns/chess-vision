module Tests exposing (..)

import ChessTests
import SquaresToIterateTests
import Test exposing (Test, describe)


all : Test
all =
    describe "chess" [ ChessTests.all, SquaresToIterateTests.all ]
