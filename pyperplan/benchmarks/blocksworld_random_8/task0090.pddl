

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b8)
(on-table b2)
(on b3 b2)
(on-table b4)
(on b5 b4)
(on b6 b3)
(on b7 b1)
(on-table b8)
(clear b5)
(clear b6)
(clear b7)
(arm-empty)
)
(:goal
(and
(on b2 b6)
(on b3 b4)
(on b5 b8)
(on b6 b1)
(on b7 b5)
(on b8 b3))
)
)


