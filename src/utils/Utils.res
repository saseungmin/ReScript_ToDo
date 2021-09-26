open Types.Todo

let todoActions = (action, state) => {
  let result: Types.Todo.state = switch action {
  | RemoveTodo(id) =>
    let todos = state.todos->Js.Array2.filter(todo => todo.id !== id)

    {...state, todos: todos}
  | ToggleTodo(id) =>
    let todos = state.todos->Belt.Array.map(todo =>
      if todo.id === id {
        {...todo, completed: !todo.completed}
      } else {
        todo
      }
    )

    {...state, todos: todos}
  | AddTodo(content) =>
    let newTodo = [
      {
        id: state.nextId,
        content: content,
        completed: false,
      },
    ]

    let newTodos = state.todos->Belt.Array.concat(newTodo)

    {todos: newTodos, nextId: state.nextId + 1}
  | EditTodo(id, content) =>
    let todos = state.todos->Belt.Array.map(todo =>
      if todo.id === id {
        {...todo, content: content}
      } else {
        todo
      }
    )

    {...state, todos: todos}
  }

  Storage.Todo.setTodoToLocalStorage(result)

  result
}
