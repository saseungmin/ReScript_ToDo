@react.component
let make = (~todo: Types.Todo.todo, ~onRemove) => {
  let {id, content, completed} = todo

  let handleRemove = _ => onRemove(id)

  <li>
    {React.string(content)}
    <button onClick={handleRemove}> {React.string("X")} </button>
    <input type_="checkbox" checked=completed readOnly=true />
  </li>
}
