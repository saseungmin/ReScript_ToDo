open Types.Reducer

let initTodos: Types.Todo.todos = [
  {id: 1, content: "Rescript", completed: false},
  {id: 2, content: "JavaScript", completed: true},
  {id: 3, content: "TypeScript", completed: true},
]

@react.component
let make = () => {
  let greeting = "What are your plans for today?"
  let (state, dispatch) = React.useReducer(Reducer.reducer, initTodos)

  let onRemove = id => dispatch(RemoveTodo(id))
  let onToggle = id => dispatch(ToggleTodo(id))

  <> <div> {React.string(greeting)} </div> <TodoList todos=state onRemove onToggle /> </>
}
