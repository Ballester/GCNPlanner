

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b8)
(on b2 b6)
(on-table b3)
(on b4 b7)
(on b5 b3)
(on-table b6)
(on b7 b1)
(on b8 b5)
(clear b2)
(clear b4)
(arm-empty)
)
(:goal
(and
(on b1 b2)
(on b3 b5)
(on b4 b1)
(on b7 b4)
(on b8 b6))
)
)


