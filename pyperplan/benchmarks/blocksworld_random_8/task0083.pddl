

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on-table b1)
(on-table b2)
(on b3 b4)
(on-table b4)
(on b5 b7)
(on b6 b8)
(on b7 b1)
(on b8 b5)
(clear b2)
(clear b3)
(clear b6)
(arm-empty)
)
(:goal
(and
(on b1 b4)
(on b2 b1)
(on b3 b5)
(on b5 b6)
(on b6 b7)
(on b7 b8))
)
)

