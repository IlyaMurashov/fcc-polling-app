port module Main exposing (..)

import Test exposing (concat)
import Tests
import Test.Runner.Node exposing (run, TestProgram)
import Json.Encode exposing (Value)
import Data.UserTest exposing (all)


main : TestProgram
main =
    run emit
        (concat
            [ Tests.all
            , Data.UserTest.all
            ]
        )


port emit : ( String, Value ) -> Cmd msg
