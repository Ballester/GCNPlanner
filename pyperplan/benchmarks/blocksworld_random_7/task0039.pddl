

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on b1 b4)
(on b2 b7)
(on b3 b6)
(on-table b4)
(on b5 b3)
(on-table b6)
(on b7 b1)
(clear b2)
(clear b5)
(arm-empty)
)
(:goal
(and
(on b1 b4)
(on b4 b5)
(on b5 b6)
(on b6 b7)
(on b7 b3))
)
)


