

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on-table b1)
(on b2 b5)
(on-table b3)
(on-table b4)
(on b5 b4)
(on b6 b1)
(on b7 b6)
(clear b2)
(clear b3)
(clear b7)
(arm-empty)
)
(:goal
(and
(on b1 b7)
(on b3 b1)
(on b5 b3)
(on b6 b4)
(on b7 b2))
)
)


