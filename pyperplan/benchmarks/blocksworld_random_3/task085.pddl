

(define (problem BW-rand-3)
(:domain blocksworld)
(:objects b1 b2 b3 )
(:init
(on-table b1)
(on b2 b1)
(on-table b3)
(clear b2)
(clear b3)
(arm-empty)
)
(:goal
(and
(on b1 b2)
(on b2 b3))
)
)


