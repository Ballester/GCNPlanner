

(define (problem BW-rand-5)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 )
(:init
(on-table b1)
(on b2 b1)
(on-table b3)
(on-table b4)
(on b5 b3)
(clear b2)
(clear b4)
(clear b5)
(arm-empty)
)
(:goal
(and
(on b1 b2)
(on b2 b3)
(on b3 b5)
(on b4 b1))
)
)


