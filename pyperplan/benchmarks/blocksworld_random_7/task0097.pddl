

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on b1 b4)
(on b2 b3)
(on-table b3)
(on-table b4)
(on-table b5)
(on b6 b1)
(on b7 b6)
(clear b2)
(clear b5)
(clear b7)
(arm-empty)
)
(:goal
(and
(on b1 b6)
(on b2 b1)
(on b3 b2)
(on b6 b7))
)
)


