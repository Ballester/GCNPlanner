

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b4)
(on b2 b1)
(on b3 b7)
(on b4 b8)
(on b5 b3)
(on b6 b5)
(on b7 b2)
(on-table b8)
(clear b6)
(arm-empty)
)
(:goal
(and
(on b1 b3)
(on b3 b5)
(on b4 b2)
(on b5 b6)
(on b6 b7)
(on b7 b4))
)
)


