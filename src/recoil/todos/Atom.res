open Types

let initialTodos: array<Todo.todo> = [
  {id: 1, content: "Rescript", completed: false},
  {id: 2, content: "JavaScript", completed: true},
  {id: 3, content: "TypeScript", completed: true},
]

let initState: Todo.state = {
  todos: initialTodos,
  nextId: 4,
}

let todoListAtom = Recoil.atom({
  key: "todoListAtom",
  default: initState,
})

let todoListFilterAtom = Recoil.atom({
  key: "todoListFilterAtom",
  default: Todo.ShowAll,
})
