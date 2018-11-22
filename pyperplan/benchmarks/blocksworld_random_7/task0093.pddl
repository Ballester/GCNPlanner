

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on b1 b5)
(on-table b2)
(on b3 b7)
(on b4 b1)
(on b5 b6)
(on-table b6)
(on-table b7)
(clear b2)
(clear b3)
(clear b4)
(arm-empty)
)
(:goal
(and
(on b1 b3)
(on b2 b4)
(on b3 b6)
(on b4 b5)
(on b6 b7))
)
)


