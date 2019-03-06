module ScrabbleScore exposing (scoreWord)

import Dict exposing (Dict)


scoreWord : String -> Int
scoreWord =
    String.toLower
        >> String.toList
        >> List.map (lookupScore scoreTable)
        >> List.sum


lookupScore : Dict Char Int -> Char -> Int
lookupScore dict chr =
    Dict.get chr dict
        |> Maybe.withDefault 0


scoreTable : Dict Char Int
scoreTable =
    pointsPerLetter
        |> List.concatMap toTuples
        |> Dict.fromList


toTuples : ( List Char, Int ) -> List ( Char, Int )
toTuples ( letters, points ) =
    List.map (\c -> ( c, points )) letters


pointsPerLetter : List ( List Char, Int )
pointsPerLetter =
    [ ( [ 'a', 'e', 'i', 'o', 'u', 'l', 'n', 'r', 's', 't' ], 1 )
    , ( [ 'd', 'g' ], 2 )
    , ( [ 'b', 'c', 'm', 'p' ], 3 )
    , ( [ 'f', 'h', 'v', 'w', 'y' ], 4 )
    , ( [ 'k' ], 5 )
    , ( [ 'j', 'x' ], 8 )
    , ( [ 'q', 'z' ], 10 )
    ]
