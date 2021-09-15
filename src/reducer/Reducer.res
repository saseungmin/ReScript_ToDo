let reducer = (state: Types.Todo.todos, action: Types.Reducer.action) =>
  switch action {
  | RemoveTodo(id) => Js.Array2.filter(state, todo => todo.id !== id)
  }
