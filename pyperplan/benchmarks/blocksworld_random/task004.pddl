

(define (problem BW-rand-5)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 )
(:init
(on-table b1)
(on-table b2)
(on b3 b4)
(on-table b4)
(on b5 b3)
(clear b1)
(clear b2)
(clear b5)
(arm-empty)
)
(:goal
(and
(on b1 b3)
(on b3 b5))
)
)


