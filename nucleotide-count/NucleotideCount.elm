module NucleotideCount exposing (nucleotideCounts)


type alias NucleotideCounts =
    { a : Int
    , t : Int
    , c : Int
    , g : Int
    }


nucleotideCounts : String -> NucleotideCounts
nucleotideCounts =
    String.toList >> List.foldr incrementCount initialCounts


incrementCount : Char -> NucleotideCounts -> NucleotideCounts
incrementCount chr ({ a, t, c, g } as counts) =
    case chr of
        'A' ->
            { counts | a = a + 1 }

        'T' ->
            { counts | t = t + 1 }

        'C' ->
            { counts | c = c + 1 }

        'G' ->
            { counts | g = g + 1 }

        _ ->
            counts


initialCounts : NucleotideCounts
initialCounts =
    { a = 0, t = 0, c = 0, g = 0 }
