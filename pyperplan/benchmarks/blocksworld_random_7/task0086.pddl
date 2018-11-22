

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on b1 b5)
(on b2 b3)
(on b3 b4)
(on b4 b1)
(on b5 b7)
(on-table b6)
(on b7 b6)
(clear b2)
(arm-empty)
)
(:goal
(and
(on b2 b4)
(on b3 b5)
(on b4 b6)
(on b5 b7)
(on b7 b2))
)
)


