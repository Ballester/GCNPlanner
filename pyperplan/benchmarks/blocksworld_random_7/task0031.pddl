

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on b1 b5)
(on b2 b3)
(on b3 b1)
(on b4 b2)
(on b5 b6)
(on-table b6)
(on b7 b4)
(clear b7)
(arm-empty)
)
(:goal
(and
(on b1 b2)
(on b5 b7)
(on b6 b3))
)
)


