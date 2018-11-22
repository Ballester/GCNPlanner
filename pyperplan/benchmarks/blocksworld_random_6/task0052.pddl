

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(on-table b1)
(on-table b2)
(on b3 b4)
(on b4 b5)
(on-table b5)
(on b6 b2)
(clear b1)
(clear b3)
(clear b6)
(arm-empty)
)
(:goal
(and
(on b1 b5)
(on b3 b2)
(on b4 b3)
(on b5 b4))
)
)


