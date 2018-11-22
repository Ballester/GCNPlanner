

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(on b1 b4)
(on b2 b3)
(on b3 b1)
(on-table b4)
(on b5 b2)
(on b6 b5)
(clear b6)
(arm-empty)
)
(:goal
(and
(on b1 b6)
(on b2 b5)
(on b4 b3)
(on b5 b1)
(on b6 b4))
)
)


