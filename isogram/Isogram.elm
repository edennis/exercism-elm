module Isogram exposing (isIsogram)

import Set


isIsogram : String -> Bool
isIsogram sentence =
    numChars sentence == numUniqueChars sentence


numChars : String -> Int
numChars =
    normalize >> String.length


numUniqueChars : String -> Int
numUniqueChars =
    normalize >> String.toList >> Set.fromList >> Set.size


normalize : String -> String
normalize =
    String.filter Char.isAlpha >> String.toLower
