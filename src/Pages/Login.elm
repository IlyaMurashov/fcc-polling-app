module Pages.Login exposing (view, Msg)

import Html exposing (Html, a, br, div, img, p, text)
import Html.Attributes exposing (alt, class, href, id, src)
import Html.Events exposing (onClick)


-- UPDATE --


type Msg
    = LoginMsg



-- VIEW --


view : Html Msg
view =
    div [ class "login" ]
        [ img [ src "/public/img/clementine_150.png" ] []
        , br [] []
        , p [ class "clementine-text" ]
            [ text "Clementine.js" ]
        , a [ href "/auth/github" ]
            [ div [ class "btn", id "login-btn" ]
                [ img [ alt "github logo", src "/public/img/github_32px.png" ] []
                , p [] [ text "LOGIN WITH GITHUB" ]
                ]
            ]
        ]
