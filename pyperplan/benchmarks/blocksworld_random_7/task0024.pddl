

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on b1 b7)
(on b2 b1)
(on-table b3)
(on-table b4)
(on b5 b6)
(on-table b6)
(on-table b7)
(clear b2)
(clear b3)
(clear b4)
(clear b5)
(arm-empty)
)
(:goal
(and
(on b1 b2)
(on b2 b7)
(on b4 b5)
(on b5 b1))
)
)


