

(define (problem BW-rand-5)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 )
(:init
(on b1 b4)
(on-table b2)
(on b3 b1)
(on-table b4)
(on b5 b2)
(clear b3)
(clear b5)
(arm-empty)
)
(:goal
(and
(on b2 b5)
(on b3 b1)
(on b4 b2)
(on b5 b3))
)
)


