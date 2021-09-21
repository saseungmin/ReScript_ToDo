open Belt
open Utils

@react.component
let make = (~todos) => {
  let setTodoState = Recoil.useSetRecoilState(Atom.todoListAtom)

  let onRemove = id => id->RemoveTodo->todoActions->setTodoState
  let onToggle = id => id->ToggleTodo->todoActions->setTodoState

  <ul>
    {Array.map(todos, todo =>
      <TodoItem key={todo.id->Int.toString} todo onRemove onToggle />
    )->React.array}
  </ul>
}
