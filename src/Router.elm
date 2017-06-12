module Router exposing (Route(..), parseLocation)

import Navigation exposing (Location)
import UrlParser exposing (Parser, map, oneOf, parseHash, s, top)


type Route
    = HomeRoute
    | LoginRoute
    | NotFound


matchers : Parser (Route -> a) a
matchers =
    oneOf
        [ map HomeRoute top
        , map LoginRoute (s "login")
        ]


parseLocation : Location -> Route
parseLocation location =
    case (parseHash matchers location) of
        Just route ->
            route

        Nothing ->
            NotFound
