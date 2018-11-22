

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on-table b1)
(on b2 b1)
(on b3 b6)
(on b4 b7)
(on-table b5)
(on b6 b5)
(on b7 b3)
(clear b2)
(clear b4)
(arm-empty)
)
(:goal
(and
(on b2 b5)
(on b3 b7)
(on b4 b2)
(on b6 b4))
)
)


