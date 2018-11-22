

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on-table b1)
(on b2 b6)
(on-table b3)
(on b4 b5)
(on b5 b7)
(on b6 b3)
(on b7 b2)
(clear b1)
(clear b4)
(arm-empty)
)
(:goal
(and
(on b1 b2)
(on b3 b5)
(on b4 b6)
(on b5 b7)
(on b7 b4))
)
)


