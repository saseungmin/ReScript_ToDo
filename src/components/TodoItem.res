open Types.Todo
open Utils

@react.component
let make = (~todo) => {
  let setTodoState = Recoil.useSetRecoilState(Atom.todoListAtom)

  let (editInputState, setEditInputState) = React.useState(_ => ItemView)

  let onRemove = id => id->RemoveTodo->todoActions->setTodoState
  let onToggle = id => id->ToggleTodo->todoActions->setTodoState
  let onEdit = (id, content) => (id, content)->EditTodo->todoActions->setTodoState

  let onToggleShowEdit = editState => setEditInputState(_ => editState)

  switch editInputState {
  | ItemView => <ViewItem todo onRemove onToggle onToggleShowEdit />
  | EditInput => <EditItem todo onRemove onEdit editInputState onToggleShowEdit />
  }
}
