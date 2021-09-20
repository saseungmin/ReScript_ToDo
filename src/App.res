open WithFilter

@react.component
let make = () => {
  let todoList = Recoil.useRecoilValue(todoWithFilter)

  let greeting = "What are your plans for today?"

  <>
    <h1> {React.string(greeting)} </h1> <TodoInput /> <TodoFilter /> <TodoList todos=todoList />
  </>
}
