(module academy CAP
   (defcap CAP() true) 

   (defun hello(name: string)
    (format "Hello World, {}" [name])
   )
)

(hello "Pact by Kadena")