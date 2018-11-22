

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on b1 b5)
(on-table b2)
(on b3 b2)
(on b4 b3)
(on b5 b6)
(on b6 b7)
(on b7 b4)
(clear b1)
(arm-empty)
)
(:goal
(and
(on b1 b5)
(on b4 b3)
(on b5 b6)
(on b6 b7)
(on b7 b4))
)
)


