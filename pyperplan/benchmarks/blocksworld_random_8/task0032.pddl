

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b4)
(on b2 b7)
(on-table b3)
(on-table b4)
(on b5 b1)
(on b6 b8)
(on b7 b5)
(on-table b8)
(clear b2)
(clear b3)
(clear b6)
(arm-empty)
)
(:goal
(and
(on b2 b4)
(on b3 b1)
(on b7 b8)
(on b8 b2))
)
)


