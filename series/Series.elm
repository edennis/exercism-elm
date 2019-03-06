module Series exposing (slices)


slices : Int -> String -> Result String (List (List Int))
slices size input =
    if size < 0 then
        Err "slice length cannot be negative"

    else if size == 0 then
        Err "slice length cannot be zero"

    else if input == "" then
        Err "series cannot be empty"

    else if String.length input < size then
        Err "slice length cannot be greater than series length"

    else
        input
            |> String.toList
            |> List.map charToInt
            |> getSlices size
            |> Ok


getSlices : Int -> List Int -> List (List Int)
getSlices size ints =
    let
        slice =
            List.take size ints
    in
    if List.length slice == size then
        slice :: getSlices size (List.tail ints |> Maybe.withDefault [])

    else
        []


charToInt : Char -> Int
charToInt char =
    Char.toCode char - 48
