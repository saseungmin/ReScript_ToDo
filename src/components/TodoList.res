open Belt

@react.component
let make = (~todos: array<Types.Todo.todo>) => {
  <ul> {Array.map(todos, todo => <TodoItem key={todo.id->Int.toString} todo />)->React.array} </ul>
}
