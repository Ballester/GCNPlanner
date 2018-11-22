

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(on b1 b2)
(on-table b2)
(on-table b3)
(on b4 b1)
(on b5 b4)
(on b6 b3)
(clear b5)
(clear b6)
(arm-empty)
)
(:goal
(and
(on b2 b4)
(on b4 b3))
)
)


