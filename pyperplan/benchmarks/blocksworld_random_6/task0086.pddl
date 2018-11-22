

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(on-table b1)
(on b2 b1)
(on b3 b6)
(on b4 b2)
(on b5 b4)
(on b6 b5)
(clear b3)
(arm-empty)
)
(:goal
(and
(on b3 b5)
(on b4 b6)
(on b5 b4)
(on b6 b2))
)
)


