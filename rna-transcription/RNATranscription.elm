module RNATranscription exposing (toRNA)


toRNA : String -> Result Char String
toRNA dna =
    case String.uncons dna of
        Just ( h, t ) ->
            Result.map2 String.cons (complementOf h) (toRNA t)

        Nothing ->
            Ok ""


complementOf : Char -> Result Char Char
complementOf char =
    case char of
        'C' ->
            Ok 'G'

        'G' ->
            Ok 'C'

        'T' ->
            Ok 'A'

        'A' ->
            Ok 'U'

        badChar ->
            Err badChar
