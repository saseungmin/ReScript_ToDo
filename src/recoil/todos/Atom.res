open Types

let initialTodos: array<Todo.todo> = []

let initState: Todo.state = {
  todos: initialTodos,
  nextId: 1,
}

let todoListAtom = Recoil.atom({
  key: "todoListAtom",
  default: Storage.Todo.getTodoFromLocalStorage(initState),
})

let todoListFilterAtom = Recoil.atom({
  key: "todoListFilterAtom",
  default: Todo.ShowAll,
})
