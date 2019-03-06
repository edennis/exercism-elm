module CollatzConjecture exposing (collatz)


collatz : Int -> Result String Int
collatz start =
    if start == 1 then
        Ok 0

    else if start > 1 then
        Result.map ((+) 1) <|
            collatz
                (if modBy 2 start == 0 then
                    start // 2

                 else
                    start * 3 + 1
                )

    else
        Err "Only positive numbers are allowed"
