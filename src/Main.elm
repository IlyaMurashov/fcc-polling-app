module Main exposing (..)

import Data.Poll exposing (Poll)
import Html exposing (Html, div, text, program)
import Navigation exposing (Location)
import Pages.Login as Login exposing (view, Msg)
import RemoteData exposing (RemoteData, WebData)
import Pages.Home as Home exposing (view)
import Router exposing (Route(..), parseLocation)
import Request.Polls


-- MAIN


main : Program Never Model Msg
main =
    Navigation.program OnLocationChange
        { init = init
        , view = view
        , update = update
        , subscriptions = \_ -> Sub.none
        }



-- MODEL


type alias Model =
    { page : Page }


type Page
    = NotFoundPage
    | LoadingPage
    | HomePage Home.Model
    | LoginPage


init : Location -> ( Model, Cmd Msg )
init location =
    setRoute (parseLocation location)
        { page = LoadingPage }



-- MESSAGES


type Msg
    = LoginMsg Login.Msg
    | HomeMsg Home.Msg
    | OnLocationChange Location



-- VIEW


view : Model -> Html Msg
view model =
    case model.page of
        NotFoundPage ->
            Html.text "404"

        LoadingPage ->
            Html.text "Loading"

        HomePage subModel ->
            Home.view subModel

        LoginPage ->
            Html.map LoginMsg Login.view



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    updatePage model.page msg model


updatePage : Page -> Msg -> Model -> ( Model, Cmd Msg )
updatePage page msg model =
    case ( msg, page ) of
        ( LoginMsg msg, LoginPage ) ->
            ( model, Cmd.none )

        ( OnLocationChange location, _ ) ->
            let
                newRoute =
                    parseLocation location
            in
                setRoute newRoute model

        ( HomeMsg subMsg, HomePage subModel ) ->
            let
                ( newModel, newCmd ) =
                    Home.update subMsg subModel
            in
                ( { model | page = HomePage newModel }, Cmd.map HomeMsg newCmd )

        ( _, _ ) ->
            Debug.crash "fallthrough" ( model, Cmd.none )


setRoute : Route -> Model -> ( Model, Cmd Msg )
setRoute route model =
    case route of
        NotFound ->
            (,) { model | page = NotFoundPage } Cmd.none

        HomeRoute ->
            let
                ( subModel, subCmd ) =
                    Home.init
            in
                (,) { model | page = HomePage subModel } (Cmd.map HomeMsg subCmd)

        LoginRoute ->
            (,) { model | page = LoginPage } Cmd.none
