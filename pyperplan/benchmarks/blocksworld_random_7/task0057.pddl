

(define (problem BW-rand-7)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 )
(:init
(on b1 b5)
(on b2 b6)
(on b3 b1)
(on-table b4)
(on-table b5)
(on b6 b3)
(on-table b7)
(clear b2)
(clear b4)
(clear b7)
(arm-empty)
)
(:goal
(and
(on b2 b3)
(on b3 b6)
(on b4 b7)
(on b5 b2)
(on b6 b4)
(on b7 b1))
)
)


