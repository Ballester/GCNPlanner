

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on-table b1)
(on-table b2)
(on b3 b1)
(on b4 b3)
(on b5 b4)
(on-table b6)
(on b7 b2)
(on b8 b5)
(clear b6)
(clear b7)
(clear b8)
(arm-empty)
)
(:goal
(and
(on b1 b8)
(on b3 b2)
(on b5 b4)
(on b6 b5))
)
)


