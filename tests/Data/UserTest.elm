module Data.UserTest exposing (all)

import Json.Decode exposing (decodeString)
import Test exposing (..)
import Expect
import Data.User exposing (decoder)


all : Test
all =
    describe "Data.User"
        [ decoderTests ]


decoderTests : Test
decoderTests =
    describe "Decoder tests"
        [ test "All input is valid" <|
            \_ ->
                case decodeString decoder testString1 of
                    Ok _ ->
                        Expect.pass

                    Err err ->
                        Expect.fail err
        , test "displayName is not specified" <|
            \_ ->
                case decodeString decoder testString2 of
                    Ok _ ->
                        Expect.pass

                    Err err ->
                        Expect.fail err
        ]


testString1 : String
testString1 =
    """
    {
        "github": {
            "id": 1,
            "displayName": "tro-lo-lo",
            "username": "123",
            "publicRepos": 12
        },
        "nbrClicks": {
            "clicks": 0
        }
    }
    """


testString2 : String
testString2 =
    """
    {
        "github": {
            "id": 1,
            "displayName": null,
            "username": "123",
            "publicRepos": 12
        },
        "nbrClicks": {
            "clicks": 0
        }
    }
    """
