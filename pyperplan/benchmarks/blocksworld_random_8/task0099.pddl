

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b8)
(on-table b2)
(on-table b3)
(on b4 b3)
(on b5 b4)
(on b6 b7)
(on b7 b5)
(on b8 b6)
(clear b1)
(clear b2)
(arm-empty)
)
(:goal
(and
(on b4 b7)
(on b5 b8)
(on b6 b5)
(on b7 b6)
(on b8 b1))
)
)


