

(define (problem BW-rand-5)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 )
(:init
(on b1 b2)
(on b2 b4)
(on-table b3)
(on b4 b3)
(on b5 b1)
(clear b5)
(arm-empty)
)
(:goal
(and
(on b3 b5)
(on b4 b3)
(on b5 b2))
)
)


