open Types.Reducer
open Types.Todo

let reducer = (state, action) =>
  switch action {
  | RemoveTodo(id) =>
    let todos = Js.Array2.filter(state.todos, todo => todo.id !== id)

    {...state, todos: todos}
  | ToggleTodo(id) =>
    let todos = Belt.Array.map(state.todos, todo =>
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

    let newTodos = Js.Array2.concat(state.todos, newTodo)

    {todos: newTodos, nextId: state.nextId + 1}
  }
