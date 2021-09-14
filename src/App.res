@react.component
let make = () => {
  let greeting = "What are your plans for today?"
  let mockTodos: Types.Todo.todos = [
    {id: 1, content: "Rescript", completed: false},
    {id: 2, content: "React", completed: true},
  ]

  <> <div> {React.string(greeting)} </div> <TodoList todos=mockTodos /> </>
}
