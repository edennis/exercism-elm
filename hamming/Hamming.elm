module Hamming exposing (distance)


distance : String -> String -> Result String Int
distance left right =
    case ( String.uncons left, String.uncons right ) of
        ( Nothing, Nothing ) ->
            Ok 0

        ( Just ( lh, lt ), Just ( rh, rt ) ) ->
            let
                i =
                    if lh == rh then
                        0

                    else
                        1
            in
            Result.map ((+) i) <| distance lt rt

        _ ->
            Err "left and right strands must be of equal length"
