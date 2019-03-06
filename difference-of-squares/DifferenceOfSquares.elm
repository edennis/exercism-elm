module DifferenceOfSquares exposing (difference, squareOfSum, sumOfSquares)

import List


squareOfSum : Int -> Int
squareOfSum n =
    (List.range 1 n |> List.sum) ^ 2


sumOfSquares : Int -> Int
sumOfSquares n =
    List.sum <| List.map (\x -> x ^ 2) (List.range 1 n)


difference : Int -> Int
difference n =
    squareOfSum n - sumOfSquares n
