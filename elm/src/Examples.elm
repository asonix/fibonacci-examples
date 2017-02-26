module Examples
    exposing
        ( example1
        , example2
        , example3
        , example4
        , example5
        )

{-|
@docs example1
@docs example2
@docs example3
@docs example4
@docs example5
-}

import Fibonacci exposing (..)


{-| Get the 5th element from the Fibonacci Sequence
-}
example1 : Int
example1 =
    Fibonacci.find 5
        |> Fibonacci.get


{-| Get first five numbers from the Fibonacci Sequence
-}
example2 : List Int
example2 =
    Fibonacci.toList 5


{-| Get sum of the first 5 elements of the Fibonacci Sequence
-}
example3 : Int
example3 =
    Fibonacci.reduce 5 Fibonacci.base 0 (+)
        |> Tuple.second


{-| Get first five numbers of the Fibonacci Sequence multiplied by 5
-}
example4 : List Int
example4 =
    Fibonacci.toList 5
        |> List.map ((*) 5)


{-| Get the sums of the first five and second five elements
-}
example5 : ( Int, Int )
example5 =
    let
        {- Use a custom reduce to sum the first 5 values -}
        first_five : ( Fibonacci, Int )
        first_five =
            Fibonacci.reduce 5 Fibonacci.base 0 (+)

        {- Get the first value from the resulting tuple -}
        first_fib : Fibonacci
        first_fib =
            Tuple.first first_five

        {- Get the second value from the resulting tuple -}
        first_sum : Int
        first_sum =
            Tuple.second first_five

        {- Use a custom reduce to sum the second 5 values -}
        next_five : ( Fibonacci, Int )
        next_five =
            Fibonacci.reduce 5 first_fib 0 (+)

        {- Get the second value from the resulting tuple -}
        second_sum : Int
        second_sum =
            Tuple.second next_five
    in
        ( first_sum, second_sum )
