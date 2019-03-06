module Bob exposing (hey)


hey : String -> String
hey remark =
    let
        ( question, yelling ) =
            ( isQuestion remark, isYelling remark )
    in
    if question && yelling then
        "Calm down, I know what I'm doing!"

    else if question then
        "Sure."

    else if yelling then
        "Whoa, chill out!"

    else if isSilence remark then
        "Fine. Be that way!"

    else
        "Whatever."


isQuestion : String -> Bool
isQuestion =
    String.endsWith "?"


isSilence : String -> Bool
isSilence =
    String.trim >> String.isEmpty


isYelling : String -> Bool
isYelling =
    let
        allCaps chars =
            List.length chars > 0 && List.all Char.isUpper chars
    in
    String.toList >> List.filter Char.isAlpha >> allCaps
