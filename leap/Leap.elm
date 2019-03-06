module Leap exposing (isLeapYear)


isLeapYear : Int -> Bool
isLeapYear year =
    case ( modBy 4 year, modBy 100 year, modBy 400 year ) of
        ( 0, 0, 0 ) ->
            True

        ( 0, 0, _ ) ->
            False

        ( 0, _, _ ) ->
            True

        _ ->
            False
