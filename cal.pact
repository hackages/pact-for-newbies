(module calculator CAP
    
    (defcap CAP() true)

    (defun add(x:integer y:integer)
        (format "The result of the addition of {} and {} is {}" [x y (+ x y)])
    ) 

    (defun substract(x:integer y:integer)
        (format "The result of the substraction is {}" [(- x y)])
    ) 

    (defun multiply(x:integer y:integer)
        (format "The result of the multiplication is {}" [(* y x) ])
    )

    (defun divide(x:integer y:integer)
        (enforce (> x y) "x should be bigger than y")
        (enforce (> y 0) "y should not be equal to zero")
        (/ x y)
    )

    
    (defconst VALUES:[integer] (map (+ 1) [1 10]))

    (defun sum(nums)
        (fold (+) 0 (map (str-to-int) nums)))

    (defun mult(nums:[integer])
        (fold (*) 1 nums)
    )
)

(calculator.add 2 3)
(calculator.substract 2 3)
(calculator.multiply 2 3)
(calculator.divide 6 2)
(calculator.sum ["1" "2" "3" "12"])
(calculator.mult [10 2 12])