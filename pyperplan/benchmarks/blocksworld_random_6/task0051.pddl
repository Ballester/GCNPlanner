

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(on b1 b3)
(on-table b2)
(on-table b3)
(on-table b4)
(on-table b5)
(on b6 b5)
(clear b1)
(clear b2)
(clear b4)
(clear b6)
(arm-empty)
)
(:goal
(and
(on b2 b4)
(on b6 b2))
)
)


