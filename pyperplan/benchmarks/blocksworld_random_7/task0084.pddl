

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on-table b1)
(on b2 b1)
(on b3 b5)
(on b4 b7)
(on b5 b2)
(on b6 b3)
(on-table b7)
(clear b4)
(clear b6)
(arm-empty)
)
(:goal
(and
(on b2 b1)
(on b3 b2)
(on b7 b6))
)
)


