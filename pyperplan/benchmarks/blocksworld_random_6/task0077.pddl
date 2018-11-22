

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(on b1 b6)
(on-table b2)
(on-table b3)
(on b4 b2)
(on b5 b3)
(on-table b6)
(clear b1)
(clear b4)
(clear b5)
(arm-empty)
)
(:goal
(and
(on b2 b4))
)
)


