

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(on b1 b6)
(on-table b2)
(on b3 b5)
(on b4 b1)
(on b5 b4)
(on-table b6)
(clear b2)
(clear b3)
(arm-empty)
)
(:goal
(and
(on b3 b2)
(on b4 b6)
(on b5 b3)
(on b6 b1))
)
)


