

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b7)
(on-table b2)
(on-table b3)
(on b4 b1)
(on b5 b8)
(on b6 b2)
(on-table b7)
(on b8 b3)
(clear b4)
(clear b5)
(clear b6)
(arm-empty)
)
(:goal
(and
(on b1 b4)
(on b2 b6)
(on b3 b1)
(on b4 b2)
(on b6 b8)
(on b7 b3)
(on b8 b5))
)
)


