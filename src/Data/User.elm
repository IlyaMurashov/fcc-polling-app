module Data.User exposing (..)

import Json.Decode exposing (Decoder, int, string)
import Json.Decode.Pipeline exposing (decode, optionalAt, required, requiredAt)


type alias User =
    { id : Int
    , displayName : String
    , username : String
    , publicRepos : Int
    , clicks : Int
    }


decoder : Decoder User
decoder =
    decode User
        |> requiredAt [ "github", "id" ] int
        |> optionalAt [ "github", "displayName" ] string ""
        |> requiredAt [ "github", "username" ] string
        |> requiredAt [ "github", "publicRepos" ] int
        |> requiredAt [ "nbrClicks", "clicks" ] int
