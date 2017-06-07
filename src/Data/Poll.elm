module Data.Poll exposing (Poll, decoder)

import Json.Decode exposing (Decoder, int, string)
import Json.Decode.Pipeline exposing (decode, required)


type alias Poll =
    { name : String
    , id : Int
    , votes : Int
    }


decoder : Decoder Poll
decoder =
    decode Poll
        |> required "name" string
        |> required "id" int
        |> required "votes" int
