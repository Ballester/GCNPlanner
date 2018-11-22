

(define (problem BW-rand-3)
(:domain blocksworld)
(:objects b1 b2 b3 )
(:init
(on b1 b3)
(on-table b2)
(on b3 b2)
(clear b1)
(arm-empty)
)
(:goal
(and
(on b1 b3))
)
)


