module Model.PersonalDetails exposing (..)

import Html exposing (..)
import Html.Attributes exposing (class, classList, id)


type alias DetailWithName =
    { name : String
    , detail : String
    }


type alias PersonalDetails =
    { name : String
    , contacts : List DetailWithName
    , intro : String
    , socials : List DetailWithName
    }


viewContact : DetailWithName -> Html msg
viewContact detailWithName =
    div [ class "contact-detail" ] [ text detailWithName.detail ]

viewSocial : DetailWithName -> Html msg
viewSocial detailWithName =
    a [ class "social-link", Html.Attributes.href detailWithName.detail ] [ text detailWithName.name ]


view : PersonalDetails -> Html msg
view details =
    div [] 
    [ h1 [ id "name" ] [ text details.name ]
        , em [ id "intro" ] [ text details.intro ]
        , div [] (List.map viewContact details.contacts)
        , div [] (List.map viewSocial details.socials)
        ]
    --Debug.todo "Implement the Model.PersonalDetails.view function"
