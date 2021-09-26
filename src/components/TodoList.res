open Belt
open Types

@react.component
let make = (~todos: array<Todo.todo>) => {
  let filterState = Recoil.useRecoilValue(Atom.todoListFilterAtom)

  let emptyMessagee = switch filterState {
  | Todo.ShowAll => "There's nothing to do!"
  | Todo.ShowCompleted => "There's nothing to complete!"
  | Todo.ShowUncompleted => "You're done with your to do!"
  }

  switch todos->Js.Array.length === 0 {
  | true => <div> {emptyMessagee->React.string} </div>
  | false =>
    <ul>
      {Array.map(todos, todo => <TodoItem key={todo.id->Int.toString} todo />)->React.array}
    </ul>
  }
}
