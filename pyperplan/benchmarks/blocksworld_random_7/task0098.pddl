

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on-table b1)
(on-table b2)
(on-table b3)
(on b4 b5)
(on b5 b1)
(on b6 b2)
(on b7 b3)
(clear b4)
(clear b6)
(clear b7)
(arm-empty)
)
(:goal
(and
(on b1 b4)
(on b3 b1)
(on b4 b2)
(on b6 b5)
(on b7 b6))
)
)


