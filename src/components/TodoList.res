@react.component
let make = (~todos, ~onRemove, ~onToggle) => {
  <ul>
    {Belt.Array.map(todos, todo =>
      <TodoItem key={todo.id->Belt.Int.toString} todo onRemove onToggle />
    )->React.array}
  </ul>
}
