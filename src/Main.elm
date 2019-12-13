
module Main exposing (..)

import Browser
import Html exposing (div, text, input, button)
import Html.Events exposing (onClick, onInput)
import String exposing (fromInt, toInt)
import Debug exposing (log)


type Messages = 
    Add
    | ChangedAddText String

init = 
    {value = 52, 
    firstName = "Jesse",
    numberToAdd = 0}

view model = 
    div [] [
        text (fromInt model.value)
        , div [][]
        , input [onInput ChangedAddText][]
        , button [ onClick Add ][text "Add"]]
    -- <div></div>
parseUserNumber text = 
    let
        theMaybe = toInt text
    in
        case theMaybe of
            Just val ->
                val
            Nothing ->
                0

update msg model =
    let
        a = 1
        b = 2
        log1 = log "msg" msg
        log2 = log "model" model
    in
        case msg of
            Add ->
                { model | value = model.value + model.numberToAdd} -- modify the model itself
            ChangedAddText theTextThatYouTyped ->
                { model | numberToAdd = parseUserNumber theTextThatYouTyped}

main =
    Browser.sandbox{
        init = init
        , view = view
        , update = update
    }