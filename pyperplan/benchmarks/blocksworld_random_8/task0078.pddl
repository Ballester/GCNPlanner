

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b3)
(on b2 b8)
(on-table b3)
(on b4 b1)
(on b5 b2)
(on b6 b7)
(on b7 b5)
(on b8 b4)
(clear b6)
(arm-empty)
)
(:goal
(and
(on b1 b8)
(on b2 b5)
(on b3 b7)
(on b6 b3)
(on b8 b6))
)
)


