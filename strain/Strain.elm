module Strain exposing (discard, keep)


keep : (a -> Bool) -> List a -> List a
keep predicate list =
    case list of
        h :: t ->
            if predicate h then
                h :: keep predicate t

            else
                keep predicate t

        [] ->
            []


discard : (a -> Bool) -> List a -> List a
discard predicate =
    keep (not << predicate)
