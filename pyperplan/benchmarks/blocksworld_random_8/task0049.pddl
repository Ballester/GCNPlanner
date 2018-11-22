

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b7)
(on b2 b6)
(on b3 b8)
(on b4 b1)
(on b5 b3)
(on-table b6)
(on b7 b2)
(on b8 b4)
(clear b5)
(arm-empty)
)
(:goal
(and
(on b1 b4)
(on b2 b5)
(on b3 b6)
(on b4 b7)
(on b8 b1))
)
)


