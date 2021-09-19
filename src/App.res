open Types.Todo
open Utils

@react.component
let make = () => {
  let (todoList, setTodoList) = Recoil.useRecoilState(Atom.todoListAtom)

  let greeting = "What are your plans for today?"

  let onRemove = id => setTodoList(state => todoActions(state, RemoveTodo(id)))
  let onToggle = id => setTodoList(state => todoActions(state, ToggleTodo(id)))
  let onInsert = content => setTodoList(state => todoActions(state, AddTodo(content)))

  <>
    <h1> {React.string(greeting)} </h1>
    <TodoInput onInsert />
    <TodoList todos=todoList.todos onRemove onToggle />
  </>
}
