

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on-table b1)
(on-table b2)
(on b3 b5)
(on b4 b6)
(on b5 b4)
(on b6 b7)
(on b7 b2)
(clear b1)
(clear b3)
(arm-empty)
)
(:goal
(and
(on b2 b4)
(on b4 b5)
(on b5 b3)
(on b7 b2))
)
)


