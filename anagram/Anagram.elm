module Anagram exposing (detect)


detect : String -> List String -> List String
detect word candidates =
    candidates
        |> List.filter (not << caseVariationOf word)
        |> List.filter (isAnagram word)


caseVariationOf : String -> String -> Bool
caseVariationOf a b =
    String.toLower a == String.toLower b


isAnagram : String -> String -> Bool
isAnagram a b =
    normalize a == normalize b


normalize : String -> String
normalize =
    String.toLower
        >> String.toList
        >> List.sort
        >> String.fromList
