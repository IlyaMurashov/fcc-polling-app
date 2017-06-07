module Main exposing (..)

import Data.Poll exposing (Poll)
import Html exposing (Html, div, text, program)
import Pages.Login as Login exposing (view, Msg)
import RemoteData exposing (RemoteData, WebData)
import Pages.Home exposing (view)


-- MAIN


main : Program Never Model Msg
main =
    program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type Page
    = Login


type alias Model =
    { latestPolls : WebData (List Poll)
    }


init : ( Model, Cmd Msg )
init =
    ( Model RemoteData.NotAsked, Cmd.none )



-- MESSAGES


type Msg
    = LoginMsg Login.Msg



-- VIEW


view : Model -> Html Msg
view model =
    Pages.Home.view



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LoginMsg msg ->
            ( model, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
