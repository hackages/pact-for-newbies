(module todo-app CAP
    (defcap CAP() true)

    (defschema todo-schema 
        id:string
        desc:string
        complete:bool)
    
    (deftable todo-table:{todo-schema})

    (defun create-todo(id:string desc:string)
        @doc   "Create a todo in the database"
        ;  @model [(property desc (enforce (> (length desc) 3) "the description should be longer than 3"))]
        (enforce (> (length desc) 3) "the description should be longer than 3")
        (insert todo-table id {
            "id": id,
            "desc": desc,
            "complete":false
        })
    )

    (defun read-todo(id:string)
        (read todo-table id)
    )

    (defun update-todo(id:string desc:string)
        (with-read todo-table id {'id:=id}
        (update todo-table id { "desc": desc }))
    )

    (defun complete-todo(id:string)
        (with-read todo-table id {'id:=id}
        (update todo-table id {"complete": true}))
    )
)

(create-table todo-table)