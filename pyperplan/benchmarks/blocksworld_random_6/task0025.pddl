

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(on b1 b6)
(on-table b2)
(on b3 b5)
(on-table b4)
(on b5 b2)
(on-table b6)
(clear b1)
(clear b3)
(clear b4)
(arm-empty)
)
(:goal
(and
(on b1 b4)
(on b3 b6)
(on b6 b5))
)
)

