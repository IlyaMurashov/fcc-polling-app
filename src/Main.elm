module Main exposing (..)

import Html exposing (Html, div, text, program)
import Pages.Login as Login exposing (view, Msg)


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
    { page : Page
    , debugStatus : String
    }


init : ( Model, Cmd Msg )
init =
    ( Model Login "", Cmd.none )



-- MESSAGES


type Msg
    = LoginMsg Login.Msg



-- VIEW


view : Model -> Html Msg
view model =
    case model.page of
        Login ->
            Login.view |> Html.map LoginMsg



-- UPDATE


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        LoginMsg msg ->
            ( { model | debugStatus = "Logged in" }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none
