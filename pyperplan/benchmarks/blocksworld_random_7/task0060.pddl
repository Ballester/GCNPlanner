

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on-table b1)
(on b2 b1)
(on b3 b6)
(on b4 b7)
(on b5 b2)
(on-table b6)
(on-table b7)
(clear b3)
(clear b4)
(clear b5)
(arm-empty)
)
(:goal
(and
(on b1 b5)
(on b2 b7)
(on b3 b1)
(on b4 b2)
(on b6 b3))
)
)


