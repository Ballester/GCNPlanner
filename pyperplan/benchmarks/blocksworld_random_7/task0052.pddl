

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on b1 b7)
(on b2 b4)
(on b3 b2)
(on-table b4)
(on-table b5)
(on-table b6)
(on-table b7)
(clear b1)
(clear b3)
(clear b5)
(clear b6)
(arm-empty)
)
(:goal
(and
(on b1 b7)
(on b2 b4)
(on b3 b5)
(on b6 b2))
)
)


