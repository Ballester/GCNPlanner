

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on b1 b2)
(on b2 b5)
(on b3 b6)
(on b4 b7)
(on-table b5)
(on b6 b4)
(on b7 b1)
(clear b3)
(arm-empty)
)
(:goal
(and
(on b1 b7)
(on b3 b1)
(on b4 b3)
(on b6 b2)
(on b7 b6))
)
)


