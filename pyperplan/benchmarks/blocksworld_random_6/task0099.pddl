

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(on-table b1)
(on b2 b3)
(on-table b3)
(on b4 b2)
(on b5 b6)
(on b6 b1)
(clear b4)
(clear b5)
(arm-empty)
)
(:goal
(and
(on b3 b2)
(on b4 b1)
(on b5 b4))
)
)


