

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(on b1 b3)
(on b2 b5)
(on b3 b6)
(on-table b4)
(on b5 b4)
(on-table b6)
(clear b1)
(clear b2)
(arm-empty)
)
(:goal
(and
(on b1 b4)
(on b2 b1)
(on b4 b3)
(on b6 b2))
)
)


