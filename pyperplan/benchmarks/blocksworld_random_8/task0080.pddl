

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b6)
(on-table b2)
(on-table b3)
(on b4 b1)
(on b5 b4)
(on b6 b2)
(on b7 b8)
(on-table b8)
(clear b3)
(clear b5)
(clear b7)
(arm-empty)
)
(:goal
(and
(on b2 b6)
(on b3 b7)
(on b6 b8))
)
)


