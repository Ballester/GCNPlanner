

(define (problem BW-rand-5)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 )
(:init
(on b1 b4)
(on-table b2)
(on b3 b2)
(on b4 b5)
(on-table b5)
(clear b1)
(clear b3)
(arm-empty)
)
(:goal
(and
(on b1 b5)
(on b2 b4)
(on b3 b2))
)
)


