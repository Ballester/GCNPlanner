

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b8)
(on b2 b1)
(on b3 b7)
(on b4 b3)
(on b5 b2)
(on-table b6)
(on-table b7)
(on b8 b6)
(clear b4)
(clear b5)
(arm-empty)
)
(:goal
(and
(on b2 b5)
(on b3 b1)
(on b4 b7)
(on b6 b4)
(on b8 b6))
)
)

