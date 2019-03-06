module Acronym exposing (abbreviate)


abbreviate : String -> String
abbreviate =
    String.replace "-" " "
        >> String.words
        >> List.map firstLetter
        >> String.concat


firstLetter : String -> String
firstLetter =
    String.left 1 >> String.toUpper
