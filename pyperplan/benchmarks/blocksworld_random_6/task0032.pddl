

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(on b1 b6)
(on b2 b1)
(on-table b3)
(on b4 b3)
(on b5 b2)
(on-table b6)
(clear b4)
(clear b5)
(arm-empty)
)
(:goal
(and
(on b1 b2)
(on b2 b6)
(on b3 b5)
(on b6 b4))
)
)


