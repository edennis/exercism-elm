module AtbashCipher exposing (decode, encode)


encode : String -> String
encode plain =
    plain
        |> String.toLower
        |> String.toList
        |> List.filterMap encodeChar
        |> groupsOf 5
        |> List.map String.fromList
        |> String.join " "


decode : String -> String
decode cipher =
    cipher
        |> String.toList
        |> List.filterMap decodeChar
        |> String.fromList


encodeChar : Char -> Maybe Char
encodeChar chr =
    if Char.isAlpha chr then
        Just <| Char.fromCode (122 - (Char.toCode chr - 97))

    else if Char.isDigit chr then
        Just chr

    else
        Nothing


decodeChar : Char -> Maybe Char
decodeChar chr =
    if Char.isAlpha chr then
        Just <| Char.fromCode (97 - (Char.toCode chr - 122))

    else if Char.isDigit chr then
        Just chr

    else
        Nothing


groupsOf : Int -> List a -> List (List a)
groupsOf n list =
    doGroupsOf n list []


doGroupsOf : Int -> List a -> List (List a) -> List (List a)
doGroupsOf n list acc =
    case list of
        [] ->
            List.reverse acc

        slice ->
            doGroupsOf n (List.drop n list) (List.take n list :: acc)
