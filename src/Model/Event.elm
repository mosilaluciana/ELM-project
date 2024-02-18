module Model.Event exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList)
import Model.Event.Category exposing (EventCategory(..))
import Model.Interval as Interval exposing (Interval)


type alias Event =
    { title : String
    , interval : Interval
    , description : Html Never
    , category : EventCategory
    , url : Maybe String
    , tags : List String
    , important : Bool
    }


categoryView : EventCategory -> Html Never
categoryView category =
    case category of
        Academic ->
            text "Academic"

        Work ->
            text "Work"

        Project ->
            text "Project"

        Award ->
            text "Award"


sortByInterval : List Event -> List Event
sortByInterval events =
    List.sortWith (\eventA eventB -> Interval.compare eventA.interval eventB.interval) events

compareIntervals : Interval -> Interval -> Order
compareIntervals intervalA intervalB =
    Interval.compare intervalA intervalB


view : Event -> Html Never
view event =
    let
        eventClass =
            if event.important then
                "event event-important"
            else
                "event"

        titleElement =
            div [ class "event-title" ] [ text event.title ]

        descriptionElement =
            div [ class "event-description" ] [ event.description ]

        categoryElement =
            div [ class "event-category" ] [ categoryView event.category ]

        urlElement =
            case event.url of
                Just link ->
                    a [ class "event-url", Html.Attributes.href link ] [ text "Event Link" ]

                Nothing ->
                    text ""
    in
    div [ classList [ (eventClass, True) ] ]
        [ titleElement
        , descriptionElement
        , categoryElement
        , urlElement
        ]
   -- div [] []
   -- Debug.todo "Implement the Model.Event.view function"
