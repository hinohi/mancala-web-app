module Timer exposing (Model, Msg, init, now, subscriptions, update)

import Task
import Time



-- MODEL


type alias Model =
    { zone : Time.Zone
    , time : Time.Posix
    }


init : () -> ( Model, Cmd Msg )
init _ =
    ( Model Time.utc (Time.millisToPosix 0), Task.perform AdjustTimeZone Time.here )



-- UPDATE


type Msg
    = Tick Time.Posix
    | AdjustTimeZone Time.Zone


update : Msg -> Model -> Model
update msg model =
    case msg of
        Tick time ->
            { model | time = time }

        AdjustTimeZone zone ->
            { model | zone = zone }



-- SUBSCRIPTIONS


subscriptions : Sub Msg
subscriptions =
    Time.every 10 Tick



-- EXPORTS


now : Model -> Int
now model =
    Time.posixToMillis model.time
