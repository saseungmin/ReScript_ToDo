open Types

let reducer = (state: Todo.todos, action: Reducer.action) =>
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
