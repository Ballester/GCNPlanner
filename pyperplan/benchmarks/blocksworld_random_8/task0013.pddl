

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b4)
(on-table b2)
(on b3 b1)
(on-table b4)
(on b5 b7)
(on b6 b2)
(on b7 b6)
(on b8 b5)
(clear b3)
(clear b8)
(arm-empty)
)
(:goal
(and
(on b4 b3)
(on b5 b7)
(on b6 b8)
(on b7 b1)
(on b8 b4))
)
)


