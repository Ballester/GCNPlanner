

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(on b1 b3)
(on-table b2)
(on b3 b2)
(on b4 b6)
(on b5 b1)
(on b6 b5)
(clear b4)
(arm-empty)
)
(:goal
(and
(on b1 b3)
(on b4 b2)
(on b6 b1))
)
)


