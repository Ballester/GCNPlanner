

(define (problem BW-rand-4)
(:domain blocksworld)
(:objects b1 b2 b3 b4 )
(:init
(on-table b1)
(on b2 b4)
(on-table b3)
(on b4 b1)
(clear b2)
(clear b3)
(arm-empty)
)
(:goal
(and
(on b1 b4)
(on b4 b3))
)
)


