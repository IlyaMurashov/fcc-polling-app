module Main exposing (..)

import Data.Poll exposing (Poll)
import Html exposing (Html, div, text, program)
import Navigation exposing (Location)
import Pages.Login as Login exposing (view, Msg)
import RemoteData exposing (RemoteData, WebData)
import Pages.Home as Home exposing (view)
import Router exposing (Route(..), parseLocation)


-- MAIN


main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type alias Model =
    { route : Route }


init : Location -> ( Model, Cmd Msg )
init location =
    ( { route = parseLocation location }, Cmd.none )



-- MESSAGES


type Msg
    = LoginMsg Login.Msg
    | OnLocationChange Location



-- VIEW


view : Model -> Html Msg
view model =
    case model.route of
        NotFound ->
            Html.text "404"

        HomeRoute ->
            Home.view

        LoginRoute ->
            Html.map LoginMsg Login.view



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LoginMsg msg ->
            ( model, Cmd.none )

        OnLocationChange location ->
            let
                newRoute =
                    parseLocation location
            in
                ( { model | route = newRoute }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
