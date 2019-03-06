module Pangram exposing (isPangram)

import Set


isPangram : String -> Bool
isPangram =
    String.filter Char.isAlpha
        >> String.toLower
        >> String.toList
        >> Set.fromList
        >> Set.toList
        >> String.fromList
        >> (==) "abcdefghijklmnopqrstuvwxyz"
