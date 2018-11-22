

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b5)
(on b2 b4)
(on b3 b1)
(on-table b4)
(on b5 b6)
(on b6 b2)
(on-table b7)
(on b8 b7)
(clear b3)
(clear b8)
(arm-empty)
)
(:goal
(and
(on b1 b2)
(on b3 b5)
(on b4 b1)
(on b5 b6)
(on b6 b4)
(on b7 b3))
)
)


