

(define (problem BW-rand-8)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 b6 b7 b8 )
(:init
(on b1 b3)
(on-table b2)
(on b3 b2)
(on-table b4)
(on-table b5)
(on b6 b1)
(on-table b7)
(on b8 b7)
(clear b4)
(clear b5)
(clear b6)
(clear b8)
(arm-empty)
)
(:goal
(and
(on b2 b4)
(on b3 b1)
(on b4 b3)
(on b5 b2)
(on b6 b7)
(on b8 b5))
)
)


