

(define (problem BW-rand-5)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 )
(:init
(on b1 b5)
(on-table b2)
(on-table b3)
(on-table b4)
(on b5 b4)
(clear b1)
(clear b2)
(clear b3)
(arm-empty)
)
(:goal
(and
(on b3 b5)
(on b5 b1))
)
)


