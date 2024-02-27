(module todo-app CAP
    (defcap CAP() true)

    (defschema todo-schema 
        id:string
        desc:string
        complete:bool)
    
    (deftable todo-table:{todo-schema})

    (defun create-todo(id:string desc:string)
        (insert todo-table id {
            "id": id,
            "desc": desc,
            "complete":false
        })
    )
)

(create-table todo-table)