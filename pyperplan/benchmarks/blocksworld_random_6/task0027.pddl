

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(on b1 b5)
(on-table b2)
(on-table b3)
(on-table b4)
(on b5 b2)
(on b6 b1)
(clear b3)
(clear b4)
(clear b6)
(arm-empty)
)
(:goal
(and
(on b3 b6)
(on b5 b3)
(on b6 b1))
)
)


