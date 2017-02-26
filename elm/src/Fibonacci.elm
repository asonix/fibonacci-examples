module Fibonacci
    exposing
        ( Fibonacci
        , base
        , next
        , find
        , findFrom
        , get
        , toList
        )

{-|
@docs Fibonacci
@docs base
@docs next
@docs find
@docs findFrom
@docs get
@docs toList
-}


{-| The Fibonacci Data type

There are three states.
    - Invalid
    - Start
    - Continue Int Int

The `Invalid` state is returned when malformed data is passed to the function.
For example, we cannot compute the negative first Fibonacci number.

The `Start` state is the zero-value of the Fibonacci Sequence. Since at the
beginning, we only have one number (0).

The `Continue Int Int` state is for representing any element in the Fibonacci
sequence after the first number, since each next value relies on the two
preceding values.
-}
type Fibonacci
    = Invalid
    | Start
    | Continue Int Int


{-| Provide the base state.

This allows external applications to reference the base-state of a
Fibonacci sequence without allowing it direct access to the contents
of the type.
-}
base : Fibonacci
base =
    Start


{-| Calculate the next Fibonacci number from a fibonacci number.

Invalid numbers return an Invalid next case

`Start` is converted to `Continue 1 0` to initialize the sequence

`Continue` sums the two numbers for the new number
-}
next : Fibonacci -> Fibonacci
next fib =
    case fib of
        Invalid ->
            Invalid

        Start ->
            Continue 1 0

        Continue last prev ->
            Continue (last + prev) last


{-| Find the `nth` value of the Fibonacci Sequence

This is a wrapper of findFrom
-}
find : Int -> Fibonacci
find count =
    findFrom count Start


{-| Find `n` more numbers from the current Fibonacci number
-}
findFrom : Int -> Fibonacci -> Fibonacci
findFrom count fib =
    if count > 0 then
        findFrom (count - 1) (next fib)
    else if count == 0 then
        fib
    else
        Invalid


{-| Convert the sequence of numbers to `n` into a list
-}
toList : Int -> List Int
toList count =
    reduce count Start [] (\acc n -> acc ++ [ n ])
        |> Tuple.second


{-| Get a value from the Fibonacci type

Invalid is converted to 0
-}
get : Fibonacci -> Int
get fib =
    case fib of
        Invalid ->
            0

        Start ->
            0

        Continue num _ ->
            num


{-| Compose `n` elements from a Fibonacci number into an accumulator
-}
reduce : Int -> Fibonacci -> a -> (a -> Int -> a) -> ( Fibonacci, a )
reduce count fib accumulator fn =
    if count > 0 then
        reduce (count - 1) (next fib) (fn accumulator (get fib)) fn
    else if count == 0 then
        ( fib, accumulator )
    else
        ( Invalid, accumulator )
