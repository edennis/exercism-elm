module Sublist exposing (ListComparison(..), sublist)


type ListComparison
    = Equal
    | Superlist
    | Sublist
    | Unequal


sublist : List a -> List a -> ListComparison
sublist alist blist =
    let
        order =
            compare (List.length alist) (List.length blist)

        ( a, b ) =
            if order == GT then
                ( blist, alist )

            else
                ( alist, blist )
    in
    case ( order, contains a b ) of
        ( EQ, True ) ->
            Equal

        ( GT, True ) ->
            Superlist

        ( LT, True ) ->
            Sublist

        _ ->
            Unequal


contains : List a -> List a -> Bool
contains needle haystack =
    case ( needle, haystack ) of
        ( [], _ ) ->
            True

        ( _, [] ) ->
            False

        _ ->
            if needle == List.take (List.length needle) haystack then
                True

            else
                contains needle (List.drop 1 haystack)
