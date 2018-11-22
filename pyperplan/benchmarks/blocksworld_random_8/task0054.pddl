

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b4)
(on b2 b7)
(on-table b3)
(on b4 b6)
(on b5 b8)
(on b6 b5)
(on-table b7)
(on-table b8)
(clear b1)
(clear b2)
(clear b3)
(arm-empty)
)
(:goal
(and
(on b1 b2)
(on b5 b7)
(on b6 b5)
(on b7 b4)
(on b8 b6))
)
)


