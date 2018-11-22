

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on b1 b4)
(on b2 b1)
(on b3 b6)
(on b4 b3)
(on-table b5)
(on b6 b7)
(on b7 b5)
(clear b2)
(arm-empty)
)
(:goal
(and
(on b1 b3)
(on b5 b7)
(on b7 b1))
)
)


