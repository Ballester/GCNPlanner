

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(on-table b1)
(on b2 b5)
(on b3 b1)
(on-table b4)
(on b5 b4)
(on b6 b2)
(clear b3)
(clear b6)
(arm-empty)
)
(:goal
(and
(on b1 b4)
(on b3 b1)
(on b4 b5)
(on b5 b2)
(on b6 b3))
)
)


