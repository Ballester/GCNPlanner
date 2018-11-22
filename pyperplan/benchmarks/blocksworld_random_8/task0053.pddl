

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b5)
(on-table b2)
(on b3 b1)
(on-table b4)
(on b5 b4)
(on b6 b3)
(on b7 b6)
(on b8 b2)
(clear b7)
(clear b8)
(arm-empty)
)
(:goal
(and
(on b1 b6)
(on b2 b7)
(on b3 b1)
(on b4 b3)
(on b7 b5))
)
)


