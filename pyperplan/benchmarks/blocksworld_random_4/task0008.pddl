

(define (problem BW-rand-4)
(:domain blocksworld)
(:objects b1 b2 b3 b4 )
(:init
(on b1 b2)
(on b2 b3)
(on-table b3)
(on-table b4)
(clear b1)
(clear b4)
(arm-empty)
)
(:goal
(and
(on b4 b3))
)
)


