module Accumulate exposing (accumulate)


accumulate : (a -> b) -> List a -> List b
accumulate func input =
    doAccumulate func input []


doAccumulate : (a -> b) -> List a -> List b -> List b
doAccumulate func input acc =
    case input of
        h :: t ->
            doAccumulate func t (func h :: acc)

        [] ->
            List.reverse acc
