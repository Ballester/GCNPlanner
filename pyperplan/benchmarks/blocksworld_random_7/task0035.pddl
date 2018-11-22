

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on-table b1)
(on-table b2)
(on b3 b5)
(on b4 b1)
(on b5 b4)
(on-table b6)
(on b7 b2)
(clear b3)
(clear b6)
(clear b7)
(arm-empty)
)
(:goal
(and
(on b1 b5)
(on b2 b1)
(on b3 b2)
(on b5 b4)
(on b6 b7)
(on b7 b3))
)
)


