

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b8)
(on-table b2)
(on-table b3)
(on-table b4)
(on b5 b3)
(on-table b6)
(on b7 b5)
(on b8 b7)
(clear b1)
(clear b2)
(clear b4)
(clear b6)
(arm-empty)
)
(:goal
(and
(on b1 b5)
(on b4 b3)
(on b5 b6)
(on b6 b8))
)
)


