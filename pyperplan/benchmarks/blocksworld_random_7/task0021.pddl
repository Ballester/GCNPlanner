

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on b1 b7)
(on b2 b4)
(on-table b3)
(on b4 b1)
(on-table b5)
(on-table b6)
(on b7 b6)
(clear b2)
(clear b3)
(clear b5)
(arm-empty)
)
(:goal
(and
(on b2 b1)
(on b4 b7)
(on b5 b6)
(on b6 b4)
(on b7 b3))
)
)


