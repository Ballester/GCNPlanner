

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b8)
(on b2 b5)
(on b3 b4)
(on b4 b6)
(on-table b5)
(on-table b6)
(on b7 b2)
(on b8 b3)
(clear b1)
(clear b7)
(arm-empty)
)
(:goal
(and
(on b1 b4)
(on b3 b2)
(on b4 b8)
(on b6 b7)
(on b7 b1))
)
)


