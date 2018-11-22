

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b3)
(on-table b2)
(on b3 b2)
(on-table b4)
(on b5 b6)
(on-table b6)
(on b7 b1)
(on b8 b4)
(clear b5)
(clear b7)
(clear b8)
(arm-empty)
)
(:goal
(and
(on b1 b7)
(on b3 b6)
(on b5 b2)
(on b6 b4)
(on b7 b5)
(on b8 b1))
)
)


