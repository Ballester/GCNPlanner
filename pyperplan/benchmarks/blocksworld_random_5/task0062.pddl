

(define (problem BW-rand-5)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 )
(:init
(on b1 b5)
(on-table b2)
(on-table b3)
(on b4 b1)
(on b5 b2)
(clear b3)
(clear b4)
(arm-empty)
)
(:goal
(and
(on b3 b2))
)
)

