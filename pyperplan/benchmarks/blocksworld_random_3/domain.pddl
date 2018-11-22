(define (domain blocksworld)
  (:requirements :strips)
  (:types block)
(:predicates (clear ?x)
             (on-table ?x)
             (arm-empty)
             (holding ?x)
             (on ?x ?y))

(:action pick-up
  :parameters (?x)
  :precondition (and (clear ?x) (on-table ?x) (arm-empty))
  :effect (and (holding ?x) (not (clear ?x)) (not (on-table ?x))
               (not (arm-empty))))

(:action put-down
  :parameters  (?x)
  :precondition (holding ?x)
  :effect (and (clear ?x) (arm-empty) (on-table ?x)
               (not (holding ?x))))

(:action stack
  :parameters (?x ?y)
  :precondition (and (clear ?y) (holding ?x))
  :effect (and (arm-empty) (clear ?x) (on ?x ?y)
               (not (clear ?y)) (not (holding ?x))))

(:action unstack
  :parameters  (?x ?y)
  :precondition (and (on ?x ?y) (clear ?x) (arm-empty))
  :effect (and (holding ?x) (clear ?y)
               (not (on ?x ?y)) (not (clear ?x)) (not (arm-empty)))))
