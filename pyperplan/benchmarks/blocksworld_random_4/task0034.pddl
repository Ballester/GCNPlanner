

(define (problem BW-rand-4)
(:domain blocksworld)
(:objects b1 b2 b3 b4 )
(:init
(on-table b1)
(on b2 b3)
(on b3 b4)
(on-table b4)
(clear b1)
(clear b2)
(arm-empty)
)
(:goal
(and
(on b1 b2)
(on b2 b4)
(on b4 b3))
)
)


