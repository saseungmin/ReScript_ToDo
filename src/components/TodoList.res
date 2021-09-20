open Belt
open Utils

@react.component
let make = (~todos) => {
  let (_, setTodoState) = Recoil.useRecoilState(Atom.todoListAtom)

  let onRemove = id => setTodoState(state => todoActions(state, RemoveTodo(id)))
  let onToggle = id => setTodoState(state => todoActions(state, ToggleTodo(id)))

  <ul>
    {Array.map(todos, todo =>
      <TodoItem key={todo.id->Int.toString} todo onRemove onToggle />
    )->React.array}
  </ul>
}
