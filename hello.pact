(module exercise CAP
    
    (defcap CAP() true)
    
    (defun hello(name: string)
        (format "Hello world {}" [name])
    )
)

(hello "Xavier and Camil")