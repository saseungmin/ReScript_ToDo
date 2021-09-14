@react.component
let make = (~todo: Types.Todo.todo) => {
  let {id, content, completed} = todo

  <li>
    {React.string(content)}
    <button> {React.string("X")} </button>
    <input type_="checkbox" checked=completed readOnly=true />
  </li>
}
