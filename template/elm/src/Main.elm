module Main exposing (main)

import Browser
import Html exposing (..)


main : Program () Model Msg
main =
    Browser.sandbox
        { init = init
        , view = view
        , update = update
        }


type alias Model =
    { text : String }


init : Model
init =
    { text = "Hello, World!" }


view : Model -> Html Msg
view model =
    div [] [ text model.text ]


type Msg
    = Noop


update : Msg -> Model -> Model
update msg model =
    case msg of
        Noop ->
            model
