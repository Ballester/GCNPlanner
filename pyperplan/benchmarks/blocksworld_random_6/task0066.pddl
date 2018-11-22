

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(on b1 b5)
(on b2 b3)
(on-table b3)
(on b4 b2)
(on b5 b6)
(on b6 b4)
(clear b1)
(arm-empty)
)
(:goal
(and
(on b1 b6)
(on b2 b1)
(on b3 b2)
(on b5 b4))
)
)


