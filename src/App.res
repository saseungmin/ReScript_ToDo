let initTodos: Types.Todo.todos = [
  {id: 1, content: "Rescript", completed: false},
  {id: 2, content: "React", completed: true},
]

@react.component
let make = () => {
  let greeting = "What are your plans for today?"
  let (state, dispatch) = React.useReducer(Reducer.reducer, initTodos)

  let onRemove = id => dispatch(Types.Reducer.RemoveTodo(id))

  <> <div> {React.string(greeting)} </div> <TodoList todos=state onRemove /> </>
}
