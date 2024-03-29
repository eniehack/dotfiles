-- SPDX-License-Identifier: 
module Main exposing (main)

import Browser
import Html exposing (div)

main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

-- MODEL

type alias Model =
    { {{_cursor_}}
    }

init : () -> (Model, Cmd Msg)
init _ =
    ( Model
    , Cmd.none
    )

-- UPDATE

type Msg
    =

update : Msg -> Model -> (Model, Cmd Msg)
update msg model =
    case msg of
        

-- SUBSCRIPTIONS

subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none

-- VIEW

view : Model -> Html Msg
view model =
    div [] []
