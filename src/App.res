open Types.Reducer

let initialTodos: array<Types.Todo.todo> = [
  {id: 1, content: "Rescript", completed: false},
  {id: 2, content: "JavaScript", completed: true},
  {id: 3, content: "TypeScript", completed: true},
]

@react.component
let make = () => {
  let (state, dispatch) = React.useReducer(Reducer.reducer, {todos: initialTodos, nextId: 4})

  let greeting = "What are your plans for today?"

  let onRemove = id => dispatch(RemoveTodo(id))
  let onToggle = id => dispatch(ToggleTodo(id))
  let onInsert = content => dispatch(AddTodo(content))

  <>
    <div> {React.string(greeting)} </div>
    <TodoInput onInsert />
    <TodoList todos=state.todos onRemove onToggle />
  </>
}
