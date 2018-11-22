

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b2)
(on b2 b3)
(on b3 b8)
(on-table b4)
(on b5 b4)
(on-table b6)
(on-table b7)
(on b8 b6)
(clear b1)
(clear b5)
(clear b7)
(arm-empty)
)
(:goal
(and
(on b1 b8)
(on b2 b1)
(on b6 b5)
(on b7 b6)
(on b8 b4))
)
)


