

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on b1 b3)
(on b2 b4)
(on b3 b2)
(on b4 b6)
(on b5 b1)
(on-table b6)
(on-table b7)
(clear b5)
(clear b7)
(arm-empty)
)
(:goal
(and
(on b2 b6)
(on b3 b1)
(on b4 b2)
(on b5 b7)
(on b6 b5)
(on b7 b3))
)
)


