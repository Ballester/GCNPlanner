

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b5)
(on b2 b3)
(on-table b3)
(on-table b4)
(on b5 b7)
(on-table b6)
(on b7 b2)
(on b8 b4)
(clear b1)
(clear b6)
(clear b8)
(arm-empty)
)
(:goal
(and
(on b1 b3)
(on b4 b7)
(on b5 b8)
(on b6 b2)
(on b7 b5))
)
)


