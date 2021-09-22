module Todo = {
  type todo = {
    id: int,
    content: string,
    completed: bool,
  }

  type state = {
    todos: array<todo>,
    nextId: int,
  }

  type action = RemoveTodo(int) | ToggleTodo(int) | AddTodo(string) | EditTodo(int, string)

  type todoListFilter = ShowAll | ShowCompleted | ShowUncompleted

  type editState = EditInput | ItemView
}
