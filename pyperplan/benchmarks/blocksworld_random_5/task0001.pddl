

(define (problem BW-rand-5)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 )
(:init
(on b1 b5)
(on b2 b4)
(on-table b3)
(on b4 b1)
(on b5 b3)
(clear b2)
(arm-empty)
)
(:goal
(and
(on b5 b3))
)
)


