module Gigasecond exposing (add)

import Time


add : Time.Posix -> Time.Posix
add =
    Time.millisToPosix << (+) (10 ^ 12) << Time.posixToMillis
