

(define (problem BW-rand-5)
(:domain blocksworld)
(:objects b1 b2 b3 b4 b5 )
(:init
(on b1 b2)
(on b2 b5)
(on b3 b1)
(on b4 b3)
(on-table b5)
(clear b4)
(arm-empty)
)
(:goal
(and
(on b2 b5)
(on b5 b4))
)
)


