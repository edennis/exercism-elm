module Triangle exposing (Triangle(..), triangleKind)


type Triangle
    = Equilateral
    | Isosceles
    | Scalene


triangleKind : number -> number -> number -> Result String Triangle
triangleKind x y z =
    if List.any ((>=) 0) [ x, y, z ] then
        Err "Invalid lengths"

    else if x + y < z || y + z < x || z + x < y then
        Err "Violates inequality"

    else if x == y && y == z then
        Ok Equilateral

    else if x == y || y == z || z == x then
        Ok Isosceles

    else
        Ok Scalene
