

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(on b1 b4)
(on-table b2)
(on b3 b1)
(on-table b4)
(on b5 b3)
(on b6 b2)
(clear b5)
(clear b6)
(arm-empty)
)
(:goal
(and
(on b3 b1)
(on b4 b6)
(on b5 b3))
)
)


