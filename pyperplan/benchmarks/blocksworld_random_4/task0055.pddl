

(define (problem BW-rand-4)
(:domain blocksworld)
(:objects b1 b2 b3 b4 )
(:init
(on b1 b2)
(on-table b2)
(on b3 b4)
(on b4 b1)
(clear b3)
(arm-empty)
)
(:goal
(and
(on b1 b2)
(on b2 b3)
(on b3 b4))
)
)


