

(define (problem BW-rand-3)
(:domain blocksworld)
(:objects b1 b2 b3 )
(:init
(on-table b1)
(on b2 b3)
(on-table b3)
(clear b1)
(clear b2)
(arm-empty)
)
(:goal
(and
(on b2 b1))
)
)


