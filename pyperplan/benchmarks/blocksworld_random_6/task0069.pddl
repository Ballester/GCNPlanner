

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(on-table b1)
(on b2 b3)
(on-table b3)
(on-table b4)
(on b5 b4)
(on b6 b1)
(clear b2)
(clear b5)
(clear b6)
(arm-empty)
)
(:goal
(and
(on b1 b3)
(on b2 b1))
)
)


