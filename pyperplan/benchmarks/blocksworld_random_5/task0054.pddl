

(define (problem BW-rand-5)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 )
(:init
(on-table b1)
(on b2 b5)
(on-table b3)
(on b4 b2)
(on-table b5)
(clear b1)
(clear b3)
(clear b4)
(arm-empty)
)
(:goal
(and
(on b2 b1)
(on b3 b4)
(on b4 b5)
(on b5 b2))
)
)


