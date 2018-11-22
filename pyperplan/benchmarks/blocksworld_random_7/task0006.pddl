

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on-table b1)
(on-table b2)
(on b3 b2)
(on-table b4)
(on b5 b1)
(on b6 b7)
(on-table b7)
(clear b3)
(clear b4)
(clear b5)
(clear b6)
(arm-empty)
)
(:goal
(and
(on b1 b6)
(on b2 b5)
(on b5 b3)
(on b6 b2)
(on b7 b1))
)
)


