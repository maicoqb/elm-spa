module Main exposing (Model, Msg(..), init, main, subscriptions, update, view)

import Browser
import Browser.Navigation as Nav
import Html exposing (..)
import Html.Attributes exposing (href)
import Url
import Url.Parser as P



-- MAIN


main : Program () Model Msg
main =
    Browser.application
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        , onUrlChange = UrlChanged
        , onUrlRequest = UrlRequested
        }



-- MODEL


type alias Model =
    { key : Nav.Key
    , page : Page
    }


init : () -> Url.Url -> Nav.Key -> ( Model, Cmd Msg )
init flags url key =
    ( Model key (loadPageFrom url), Cmd.none )



-- ROUTING


type alias PageInfo =
    { page : Page
    , url : String
    , title : String
    }


type Page
    = HomePage
    | OtherPage
    | NotFound


routes : List PageInfo
routes =
    [ PageInfo HomePage "/home" "Home Page"
    , PageInfo OtherPage "/other" "Other Page"
    ]


router : P.Parser (Page -> a) a
router =
    P.oneOf
        [ P.map HomePage P.top
        , P.map HomePage (P.s "home")
        , P.map OtherPage (P.s "other")
        ]


loadPageFrom : Url.Url -> Page
loadPageFrom url =
    case (P.parse router url) of
        Just page ->
            page

        Nothing ->
            NotFound



-- UPDATE


type Msg
    = UrlChanged Url.Url
    | UrlRequested Browser.UrlRequest


update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        UrlChanged url ->
            ( model, Cmd.none )

        UrlRequested request ->
            updateRequestUrl model request


updateRequestUrl : Model -> Browser.UrlRequest -> ( Model, Cmd Msg )
updateRequestUrl model request =
    case request of
        Browser.Internal url ->
            ( model, Nav.pushUrl model.key (Url.toString url) )

        Browser.External href ->
            ( model, Nav.load href )



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions _ =
    Sub.none



-- VIEW


view : Model -> Browser.Document Msg
view model =
    { title = "Nothing"
    , body = [ viewPage model.page ]
    }


viewPage : Page -> Html Msg
viewPage page =
    case page of
        HomePage ->
            div
                []
                [ h1 [] [ text "Home Page" ]
                , viewMenu page
                ]

        OtherPage ->
            div
                []
                [ h1 [] [ text "Other Page" ]
                , viewMenu page
                ]

        NotFound ->
            div
                []
                [ h1 [] [ text "Página não encontrada!" ]
                , viewMenu page
                ]


viewMenu : Page -> Html Msg
viewMenu page =
    ul
        []
        (List.map viewMenuLink routes)


viewMenuLink : PageInfo -> Html Msg
viewMenuLink page =
    li
        []
        [ a [ href page.url ] [ text page.title ] ]
