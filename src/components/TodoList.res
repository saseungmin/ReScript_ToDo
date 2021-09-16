@react.component
let make = (~todos, ~onRemove, ~onToggle) => {
  <ul>
    {Belt.Array.map(todos, todo =>
      <TodoItem key={Belt.Int.toString(todo.id)} todo onRemove onToggle />
    )->React.array}
  </ul>
}
