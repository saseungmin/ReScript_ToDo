@react.component
let make = (~todo: Types.Todo.todo, ~onRemove, ~onToggle) => {
  let {id, content, completed} = todo

  let handleRemove = _ => onRemove(id)
  let handleToggle = _ => onToggle(id)

  <li>
    {content->React.string}
    <button onClick={handleRemove}> {"X"->React.string} </button>
    <input type_="checkbox" checked=completed onChange={handleToggle} />
  </li>
}
