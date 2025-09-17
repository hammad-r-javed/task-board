module Main exposing (..)

import Browser
import Browser.Navigation as Nav
import Element as Elem
import Element.Background as ElemBg
import Element.Border as ElemBorder
import Element.Font as ElemFont
import Element.Input as ElemInput
import Element.Region as ElemRegion
import Html exposing (Html)
import Http
import Json.Decode as JsonDecode
import Json.Encode as JsonEncode
import PageStyle as Style



-- MAIN


main : Program () Model Msg
main =
    Browser.element
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL


type Model
    = EmptyPage



-- INIT


init : () -> ( Model, Cmd Msg )
init _ =
    ( EmptyPage
    , Cmd.none
    )



-- UPDATE


baseUrl : String
baseUrl =
    -- TODO - pass this in as an arg!!!
    "http://127.0.0.1:4444"


type Msg
    = NoOp


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( EmptyPage
            , Cmd.none
            )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub msg
subscriptions model =
    Sub.none



-- VIEW


view : Model -> Html Msg
view model =
    Elem.layout
        [ ElemBg.color Style.baseBgColour
        , ElemFont.color Style.baseFontFgColor
        ]
    <|
        Elem.column
            [ Elem.width Elem.fill
            , Elem.height Elem.fill
            ]
            [ navBar model
            , pageBody model
            ]


navBar : Model -> Elem.Element Msg
navBar model =
    Elem.row
        [ Elem.width Elem.fill
        , Elem.height Elem.shrink
        , Elem.centerX
        , Elem.padding 25
        , ElemBg.color Style.elementBgColour
        , ElemBorder.shadow
            { size = 3.0
            , offset = ( 0.0, 0.0 )
            , blur = 5.0
            , color = Elem.rgb 0.05 0.05 0.05
            }
        ]
        [ Elem.el [ Elem.alignLeft ] (Elem.text "Task Board")
        ]


pageBody : Model -> Elem.Element Msg
pageBody model =
    Elem.text "WIP"
