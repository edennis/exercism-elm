module Allergies exposing (isAllergicTo, toList)

import Bitwise
import Dict exposing (Dict)


isAllergicTo : String -> Int -> Bool
isAllergicTo name score =
    case Dict.get name bitForAllergen of
        Just bit ->
            isBitSet bit score

        Nothing ->
            False


toList : Int -> List String
toList score =
    bitForAllergen
        |> Dict.filter (\allergen i -> isBitSet i score)
        |> Dict.keys


isBitSet : Int -> Int -> Bool
isBitSet bit bits =
    Bitwise.and bit bits == bit


bitForAllergen : Dict String Int
bitForAllergen =
    allergens
        |> List.indexedMap (\i allergen -> ( allergen, 2 ^ i ))
        |> Dict.fromList


allergens : List String
allergens =
    [ "eggs"
    , "peanuts"
    , "shellfish"
    , "strawberries"
    , "tomatoes"
    , "chocolate"
    , "pollen"
    , "cats"
    ]
