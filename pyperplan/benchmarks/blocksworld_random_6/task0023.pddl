

(define (problem BW-rand-6)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 )
(:init
(on-table b1)
(on-table b2)
(on b3 b4)
(on b4 b6)
(on-table b5)
(on b6 b5)
(clear b1)
(clear b2)
(clear b3)
(arm-empty)
)
(:goal
(and
(on b1 b4)
(on b2 b5)
(on b4 b2)
(on b6 b1))
)
)


