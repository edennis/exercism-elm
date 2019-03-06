module Etl exposing (transform)

import Dict exposing (Dict)


transform : Dict Int (List String) -> Dict String Int
transform input =
    Dict.foldr transformPair Dict.empty input


transformPair : Int -> List String -> Dict String Int -> Dict String Int
transformPair points letters newDict =
    List.foldr
        (\letter acc ->
            Dict.insert (String.toLower letter) points acc
        )
        newDict
        letters
