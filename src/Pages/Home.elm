module Pages.Home exposing (view, Model, init, initModel, Msg, update)

import Data.Poll exposing (Poll)
import Data.User exposing (User)
import Html exposing (Html, ul)
import RemoteData exposing (WebData)
import Request.Polls as Polls


-- MODEL --


type alias Model =
    { latestPolls : WebData (List Poll) }


init : ( Model, Cmd Msg )
init =
    ( initModel, Cmd.map OnFetchLatest Polls.fetchLatestPolls )


initModel : Model
initModel =
    { latestPolls = RemoteData.Loading }



-- VIEW --


view : Model -> Html msg
view model =
    let
        polls : Html msg
        polls =
            case model.latestPolls of
                RemoteData.NotAsked ->
                    Html.text "Not asked"

                RemoteData.Loading ->
                    Html.text "Loading"

                RemoteData.Failure er ->
                    Html.text "Failed"

                RemoteData.Success a ->
                    Html.text "Success"
    in
        Html.div []
            [ Html.text "Homepage"
            , polls
            ]



-- UPDATE --


type Msg
    = OnFetchLatest (WebData (List Poll))


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        OnFetchLatest pollList ->
            (,) { model | latestPolls = pollList } Cmd.none
