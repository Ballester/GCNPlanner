

(define (problem BW-rand-4)
(:domain blocksworld)
(:objects b1 b2 b3 b4 )
(:init
(on b1 b2)
(on-table b2)
(on b3 b1)
(on-table b4)
(clear b3)
(clear b4)
(arm-empty)
)
(:goal
(and
(on b2 b4)
(on b3 b2)
(on b4 b1))
)
)


