

(define (problem BW-rand-4)
(:domain blocksworld)
(:objects b1 b2 b3 b4 )
(:init
(on b1 b3)
(on b2 b4)
(on-table b3)
(on-table b4)
(clear b1)
(clear b2)
(arm-empty)
)
(:goal
(and
(on b3 b1)
(on b4 b3))
)
)


