

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(on-table b1)
(on-table b2)
(on b3 b5)
(on-table b4)
(on b5 b6)
(on b6 b1)
(clear b2)
(clear b3)
(clear b4)
(arm-empty)
)
(:goal
(and
(on b1 b4)
(on b3 b6)
(on b4 b5)
(on b5 b2)
(on b6 b1))
)
)


