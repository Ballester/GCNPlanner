

(define (problem BW-rand-4)
(:domain blocksworld)
(:objects b1 b2 b3 b4 )
(:init
(on-table b1)
(on-table b2)
(on-table b3)
(on b4 b1)
(clear b2)
(clear b3)
(clear b4)
(arm-empty)
)
(:goal
(and
(on b2 b1)
(on b3 b4))
)
)


