

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on b1 b2)
(on-table b2)
(on-table b3)
(on-table b4)
(on b5 b3)
(on b6 b4)
(on-table b7)
(clear b1)
(clear b5)
(clear b6)
(clear b7)
(arm-empty)
)
(:goal
(and
(on b2 b6)
(on b5 b7)
(on b6 b5)
(on b7 b3))
)
)


