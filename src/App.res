open WithFilter

@react.component
let make = () => {
  let todoList = Recoil.useRecoilValue(todoWithFilter)

  let greeting = "What are your plans for today?"

  <>
    <h1> {greeting->React.string} </h1>
    <TodoStats />
    <TodoInput />
    <TodoFilter />
    <TodoList todos=todoList />
  </>
}
