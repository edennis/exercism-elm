module SumOfMultiples exposing (sumOfMultiples)

import Set


sumOfMultiples : List Int -> Int -> Int
sumOfMultiples multiples limit =
    multiples
        |> List.concatMap (multiplesOf 1 limit)
        |> Set.fromList
        |> Set.toList
        |> List.sum


multiplesOf : Int -> Int -> Int -> List Int
multiplesOf i limit n =
    if i * n < limit then
        i * n :: multiplesOf (i + 1) limit n

    else
        []
