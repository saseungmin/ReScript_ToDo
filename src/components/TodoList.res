@react.component
let make = (~todos: Types.Todo.todos) => {
  let (todos, setTodos) = React.useState(() => todos)

  <ul>
    {Belt.Array.map(todos, todo => <TodoItem key={Belt.Int.toString(todo.id)} todo />)->React.array}
  </ul>
}
