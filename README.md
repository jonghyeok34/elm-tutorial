# installation

[installation]!(https://guide.elm-lang.org/install/elm.html)

# repl - check

```
elm repl
```

- elm is strict type language

# use console.log

```elm
module Main exposing (..)

import Browser
import Html exposing (div, text, input, button)
import Html.Events exposing (onClick)
import String exposing (fromInt)
import Debug exposing (log)

add a b = a + b

type Messages =
    Add

init =
    {value = 52}

view model =
    div [] [
        text (fromInt model.value)
        , div [][]
        , input [][]
        , button [ onClick Add ][text "Add"]]
    -- <div></div>

update msg model =
    let
        a = 1
        b = 2
        log1 = log "msg" msg
        log2 = log "model" model
    in

    case msg of
        Add ->
            model
    -- console log
    -- model: {value = 52}
    -- msg: Add
main =
    Browser.sandbox{
        init = init
        , view = view
        , update = update
    }
```

# elm copy

- A = { B | a = 40}

```elm
> person = {firstName = "Jesse" , age= 39}
{ age = 39, firstName = "Jesse" }
    : { age : number, firstName : String }
> person
{ age = 39, firstName = "Jesse" }
    : { age : number, firstName : String }
> personA = { person | age = 40}
{ age = 40, firstName = "Jesse" }
```

# use more messages

```elm
import Html.Events exposing (onClick, onInput)
```

```elm

type Messages =
    Add
    | ChangedAddText String

```

```elm
view model =
    div [] [
        text (fromInt model.value)
        , div [][]
        , input [onInput ChangedAddText][]
        , button [ onClick Add ][text "Add"]]
```

```elm

update msg model =
    let
        a = 1
        b = 2
        log1 = log "msg" msg
        log2 = log "model" model
    in

    case msg of
        Add ->
            { model | value = 70} -- modify the model itself
        ChangedAddText theTextThatYouTyped ->
            let
                log3 = log "the text" theTextThatYouTyped
            in
            model

main =
    Browser.sandbox{
        init = init
        , view = view
        , update = update
    }
```

when input 'aa'

```
msg: ChangedAddText "aa" Main.elm:523
the text: "aa" Main.elm:523
```

# Maybes

## maybe?

```elm
> import String exposing (toInt)
> toInt "1"
Just 1 : Maybe Int
> toInt "01"
Just 1 : Maybe Int
> toInt " 1"
Nothing : Maybe Int
```

## deal maybe

```elm
parseUserNumber text =
    let
        theMaybe = toInt text
    in
        -- if it is val
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
                { model | value = 70} -- modify the model itself
            ChangedAddText theTextThatYouTyped ->
                { model | numberToAdd = parseUserNumber theTextThatYouTyped}

```

- when input changed console

```elm
(if it is not anumber)

msg: ChangedAddText "a"
--> result
model: { firstName = "Jesse", numberToAdd = 0, value = 70 }

(if it is a number)
msg: ChangedAddText "1"
model: { firstName = "Jesse", numberToAdd = 1, value = 52 }
```

- add number by value

```elm
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

```
