module WordCount exposing (wordCount)

import Dict exposing (Dict)


wordCount : String -> Dict String Int
wordCount =
    String.words
        >> List.map (String.toLower >> String.filter Char.isAlphaNum)
        >> List.filter (not << String.isEmpty)
        >> List.foldr
            (\word dict ->
                Dict.update word incrWordCount dict
            )
            Dict.empty


incrWordCount : Maybe Int -> Maybe Int
incrWordCount maybeInt =
    maybeInt
        |> Maybe.withDefault 0
        |> Just
        |> Maybe.map ((+) 1)
