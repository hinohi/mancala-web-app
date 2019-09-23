module Main exposing (Model)

import Browser
import Html exposing (Html, div, text)
import Timer



-- MODEL


type alias Model =
    { timer : Timer.Model }


init : () -> ( Model, Cmd Msg )
init _ =
    let
        ( timer_model, timer_cmd ) =
            Timer.init ()
    in
    ( Model timer_model, Cmd.map TimerMsg timer_cmd )



-- UPDATE


type Msg
    = TimerMsg Timer.Msg


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        TimerMsg timer_msg ->
            let
                timer_model =
                    Timer.update timer_msg model.timer
            in
            ( { model | timer = timer_model }, Cmd.none )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.map TimerMsg Timer.subscriptions



-- VIEW


view : Model -> Html Msg
view model =
    let
        now_millis =
            Timer.now model.timer
    in
    div [] [ text (String.fromInt now_millis) ]



-- MAIN


main =
    Browser.element
        { init = init
        , update = update
        , subscriptions = subscriptions
        , view = view
        }
