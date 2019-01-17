module Example exposing (suite)

import Expect exposing (Expectation)
import Fuzz exposing (Fuzzer, int, list, string)
import Test exposing (..)
import Triplet


type alias Person =
    { name : String
    , age : Int
    , alive : Bool
    }


suite : Test
suite =
    describe "Triplet package"
        [ describe "Triplet.create"
            [ test "creates a triplet"
                (\_ ->
                    Expect.equal (Triplet.triplet 1 2 3) ( 1, 2, 3 )
                )
            ]
        , describe "Triplet.first"
            [ test "returns first element"
                (\_ ->
                    Expect.equal (Triplet.first ( 1, 2, 3 )) 1
                )
            ]
        , describe "Triplet.second"
            [ test "returns second element"
                (\_ ->
                    Expect.equal (Triplet.second ( 1, 2, 3 )) 2
                )
            ]
        , describe "Triplet.third"
            [ test "returns third element"
                (\_ ->
                    Expect.equal (Triplet.third ( 1, 2, 3 )) 3
                )
            ]
        , describe "Triplet.mapFirst"
            [ test "maps first element"
                (\_ ->
                    Expect.equal (Triplet.mapFirst (\v -> v + 3) ( 1, 2, 3 )) ( 4, 2, 3 )
                )
            ]
        , describe "Triplet.mapSecond"
            [ test "maps second element"
                (\_ ->
                    Expect.equal (Triplet.mapSecond (\v -> v + 3) ( 1, 2, 3 )) ( 1, 5, 3 )
                )
            ]
        , describe "Triplet.mapThird"
            [ test "maps third element"
                (\_ ->
                    Expect.equal (Triplet.mapThird (\v -> v + 3) ( 1, 2, 3 )) ( 1, 2, 6 )
                )
            ]
        , describe "Triplet.mapAll"
            [ test "maps all elements"
                (\_ ->
                    Expect.equal (Triplet.mapAll (\v -> v + 3) (\v -> v + 3) (\v -> v + 3) ( 1, 2, 3 )) ( 4, 5, 6 )
                )
            ]
        , describe "Triplet.apply"
            [ test "applyes triplet to a constructor"
                (\_ ->
                    Expect.equal (Triplet.apply Person ( "Mahatma Gandhi", 78, False )) { name = "Mahatma Gandhi", age = 78, alive = False }
                )
            ]
        ]
