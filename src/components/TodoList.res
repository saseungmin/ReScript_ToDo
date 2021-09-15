@react.component
let make = (~todos, ~onRemove) => {
  <ul>
    {Belt.Array.map(todos, todo =>
      <TodoItem key={Belt.Int.toString(todo.id)} todo onRemove />
    )->React.array}
  </ul>
}
