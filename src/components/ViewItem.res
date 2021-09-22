open Types.Todo

@react.component
let make = (~todo, ~onRemove, ~onToggle, ~onToggleShowEdit) => {
  let {id, content, completed} = todo

  let handleRemove = _ => onRemove(id)
  let handleToggle = _ => onToggle(id)
  let handleToggleShowEdit = _ => onToggleShowEdit(EditInput)

  <li>
    <span onDoubleClick={handleToggleShowEdit}> {content->React.string} </span>
    <button onClick={handleRemove}> {"X"->React.string} </button>
    <input type_="checkbox" checked=completed onChange={handleToggle} />
  </li>
}
