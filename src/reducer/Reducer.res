open Types.Reducer
open Types.Todo

let reducer = (state: todos, action: action) =>
  switch action {
  | RemoveTodo(id) => Js.Array2.filter(state, todo => todo.id !== id)
  | ToggleTodo(id) =>
    Belt.Array.map(state, todo =>
      if todo.id === id {
        {...todo, completed: !todo.completed}
      } else {
        todo
      }
    )
  }
