

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(on-table b1)
(on-table b2)
(on b3 b2)
(on b4 b6)
(on b5 b3)
(on b6 b5)
(clear b1)
(clear b4)
(arm-empty)
)
(:goal
(and
(on b1 b5)
(on b2 b6)
(on b3 b4)
(on b4 b1)
(on b5 b2))
)
)

