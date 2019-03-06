module TwelveDays exposing (recite)


recite : Int -> Int -> List String
recite start stop =
    List.range (validRange start) (validRange stop)
        |> List.map verse


validRange : Int -> Int
validRange =
    clamp 1 12


verse : Int -> String
verse day =
    "On the "
        ++ nth day
        ++ " day of Christmas my true love gave to me, "
        ++ presentsList day
        ++ "."


presentsList : Int -> String
presentsList n =
    List.take n presents
        |> List.reverse
        |> String.join " "


nth : Int -> String
nth day =
    case day of
        1 ->
            "first"

        2 ->
            "second"

        3 ->
            "third"

        4 ->
            "fourth"

        5 ->
            "fifth"

        6 ->
            "sixth"

        7 ->
            "seventh"

        8 ->
            "eighth"

        9 ->
            "ninth"

        10 ->
            "tenth"

        11 ->
            "eleventh"

        _ ->
            "twelfth"


presents : List String
presents =
    [ "a Partridge in a Pear Tree"
    , "two Turtle Doves, and"
    , "three French Hens,"
    , "four Calling Birds,"
    , "five Gold Rings,"
    , "six Geese-a-Laying,"
    , "seven Swans-a-Swimming,"
    , "eight Maids-a-Milking,"
    , "nine Ladies Dancing,"
    , "ten Lords-a-Leaping,"
    , "eleven Pipers Piping,"
    , "twelve Drummers Drumming,"
    ]
