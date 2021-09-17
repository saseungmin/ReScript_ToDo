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
}

module Reducer = {
  type action = RemoveTodo(int) | ToggleTodo(int) | AddTodo(string)
}
