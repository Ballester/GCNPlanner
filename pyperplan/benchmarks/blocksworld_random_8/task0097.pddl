

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on-table b1)
(on-table b2)
(on b3 b2)
(on b4 b7)
(on b5 b3)
(on b6 b4)
(on b7 b8)
(on b8 b5)
(clear b1)
(clear b6)
(arm-empty)
)
(:goal
(and
(on b1 b4)
(on b2 b8)
(on b3 b1)
(on b4 b6)
(on b6 b2)
(on b7 b3))
)
)


