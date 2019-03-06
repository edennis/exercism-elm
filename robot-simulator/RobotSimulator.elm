module RobotSimulator exposing
    ( Bearing(..)
    , Robot
    , advance
    , defaultRobot
    , simulate
    , turnLeft
    , turnRight
    )


type Bearing
    = North
    | East
    | South
    | West


type alias Robot =
    { bearing : Bearing
    , coordinates : { x : Int, y : Int }
    }


defaultRobot : Robot
defaultRobot =
    { bearing = North, coordinates = { x = 0, y = 0 } }


turnRight : Robot -> Robot
turnRight ({ bearing } as robot) =
    case bearing of
        North ->
            { robot | bearing = East }

        East ->
            { robot | bearing = South }

        South ->
            { robot | bearing = West }

        West ->
            { robot | bearing = North }


turnLeft : Robot -> Robot
turnLeft ({ bearing } as robot) =
    case bearing of
        North ->
            { robot | bearing = West }

        West ->
            { robot | bearing = South }

        South ->
            { robot | bearing = East }

        East ->
            { robot | bearing = North }


advance : Robot -> Robot
advance ({ bearing, coordinates } as robot) =
    case bearing of
        North ->
            { robot | coordinates = { x = coordinates.x, y = coordinates.y + 1 } }

        East ->
            { robot | coordinates = { x = coordinates.x + 1, y = coordinates.y } }

        South ->
            { robot | coordinates = { x = coordinates.x, y = coordinates.y - 1 } }

        West ->
            { robot | coordinates = { x = coordinates.x - 1, y = coordinates.y } }


simulate : String -> Robot -> Robot
simulate directions robot =
    directions |> String.toList |> List.foldl processInstruction robot


processInstruction : Char -> Robot -> Robot
processInstruction instruction robot =
    case instruction of
        'R' ->
            turnRight robot

        'L' ->
            turnLeft robot

        'A' ->
            advance robot

        _ ->
            robot
