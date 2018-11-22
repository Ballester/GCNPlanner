

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b7)
(on b2 b3)
(on-table b3)
(on b4 b6)
(on b5 b4)
(on-table b6)
(on b7 b2)
(on b8 b1)
(clear b5)
(clear b8)
(arm-empty)
)
(:goal
(and
(on b2 b6)
(on b3 b2)
(on b4 b7)
(on b8 b4))
)
)


