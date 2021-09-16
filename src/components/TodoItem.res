@react.component
let make = (~todo: Types.Todo.todo, ~onRemove, ~onToggle) => {
  let {id, content, completed} = todo

  let handleRemove = _ => onRemove(id)
  let handleToggle = _ => onToggle(id)

  <li>
    {React.string(content)}
    <button onClick={handleRemove}> {React.string("X")} </button>
    <input type_="checkbox" checked=completed onChange={handleToggle} />
  </li>
}
