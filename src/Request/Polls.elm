module Request.Polls exposing (..)

import Http
import Json.Decode exposing (list)
import Data.Poll as Poll exposing (Poll, decoder)
import RemoteData exposing (WebData)


fetchLatestPolls : Cmd (WebData (List Poll))
fetchLatestPolls =
    Http.get "http://localhost:8080/polls" (list Poll.decoder)
        |> RemoteData.sendRequest
