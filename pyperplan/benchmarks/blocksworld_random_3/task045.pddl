

(define (problem BW-rand-3)
(:domain blocksworld)
(:objects b1 b2 b3 )
(:init
(on-table b1)
(on-table b2)
(on b3 b2)
(clear b1)
(clear b3)
(arm-empty)
)
(:goal
(and
(on b2 b1)
(on b3 b2))
)
)


