

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b4)
(on-table b2)
(on-table b3)
(on-table b4)
(on b5 b6)
(on b6 b7)
(on b7 b8)
(on b8 b2)
(clear b1)
(clear b3)
(clear b5)
(arm-empty)
)
(:goal
(and
(on b1 b3)
(on b5 b7)
(on b6 b1)
(on b7 b4))
)
)


