module Triplet exposing
    ( triplet
    , first, second, third
    , mapFirst, mapSecond, mapThird, mapAll
    , applyTo
    )

{-| 3-tuple functions aligned with elm/core 2-tuple ones.


# Create

@docs triplet


# Access

@docs first, second, third


# Map

@docs mapFirst, mapSecond, mapThird, mapAll


# Apply

@docs applyTo

-}


{-| Create a 3-tuple.

    -- triplet 3 4 5 == (3, 4, 5)
    zip : List a -> List b -> List c -> List ( a, b, c )
    zip xs ys zs =
        List.map3 Triplet.triplet xs ys

-}



-- CREATE


triplet : a -> b -> c -> ( a, b, c )
triplet a b c =
    ( a, b, c )



-- ACCESS


{-| Extract the first value from a triplet.

    first ( 3, 4, 5 ) == 3

    first ( "john", "doe", "mary" ) == "john"

-}
first : ( a, b, c ) -> a
first ( x, _, _ ) =
    x


{-| Extract the second value from a triplet.

    second ( 3, 4, 5 ) == 4

    second ( "john", "doe", "mary" ) == "doe"

-}
second : ( a, b, c ) -> b
second ( _, y, _ ) =
    y


{-| Extract the third value from a triplet.

    third ( 3, 4, 5 ) == 5

    third ( "john", "doe", "mary" ) == "mary"

-}
third : ( a, b, c ) -> c
third ( _, _, z ) =
    z



-- MAP


{-| Transform the first value in a triplet.

    import String

    mapFirst String.reverse ("stressed", 16, True) == ("desserts", 16, True)
    mapFirst String.length  ("stressed", 16, True) == (8, 16, True)

-}
mapFirst : (a -> x) -> ( a, b, c ) -> ( x, b, c )
mapFirst func ( x, y, z ) =
    ( func x, y, z )


{-| Transform the second value in a triplet.

    mapSecond sqrt ( "stressed", 16, True ) == ( "stressed", 4, True )

    mapSecond negate ( "stressed", 16, True ) == ( "stressed", -16, True )

-}
mapSecond : (b -> y) -> ( a, b, c ) -> ( a, y, c )
mapSecond func ( x, y, z ) =
    ( x, func y, z )


{-| Transform the third value in a triplet.

    mapThird not ( "stressed", 16, True ) == ( "stressed", 16, False )

-}
mapThird : (c -> z) -> ( a, b, c ) -> ( a, b, z )
mapThird func ( x, y, z ) =
    ( x, y, func z )


{-| Transform all parts of a triplet.

    import String

    mapAll String.reverse sqrt not ("stressed", 16, True) == ("desserts", 4, False)

-}
mapAll : (a -> x) -> (b -> y) -> (c -> z) -> ( a, b, c ) -> ( x, y, z )
mapAll funcA funcB funcC ( x, y, z ) =
    ( funcA x, funcB y, funcC z )



-- APPLY


{-| Apply the triplet parts to a function.

    type alias Person =
        { name : String
        , age : Int
        , alive : Bool
        }

    applyTo Person ("Mahatma Gandhi", 78, False) == { name = "Mahatma Gandhi", age = 78, alive = False }

-}
applyTo : (a -> b -> c -> t) -> ( a, b, c ) -> t
applyTo func ( x, y, z ) =
    func x y z
