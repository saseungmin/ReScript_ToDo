open Types.Todo

@send external focus: Dom.element => unit = "focus"

@module("react")
external useCallback: ('a, 'b) => 'a = "useCallback"

@react.component
let make = (~todo: Types.Todo.todo, ~editInputState, ~onToggleShowEdit, ~onRemove, ~onEdit) => {
  let {content, id} = todo
  let (inputValue, setInputValue) = React.useState(_ => content)

  let editInput = React.useRef(Js.Nullable.null)

  let isEmptyValue = value => value->Js.String.trim === "" ? None : Some(value)
  let checkKeyPress = key => key === "Enter" || key === "Escape"

  let handleChange = e => setInputValue(_ => ReactEvent.Form.target(e)["value"])

  let handleBlur = useCallback(id => {
    switch isEmptyValue(inputValue) {
    | Some(_) => ItemView->onToggleShowEdit
    | None => onRemove(id)
    }
  }, [inputValue])

  let handleKeyPress = useCallback((id, e) => {
    if checkKeyPress(ReactEvent.Keyboard.key(e)) {
      switch isEmptyValue(inputValue) {
      | Some(content) =>
        onEdit(id, content)
        ItemView->onToggleShowEdit
      | None => ()
      }
    }
  }, [inputValue])

  React.useEffect2(() => {
    if editInputState === EditInput {
      switch editInput.current->Js.Nullable.toOption {
      | Some(input) => input->focus
      | None => ()
      }
    }

    None
  }, (editInputState, editInput))

  <div>
    <input
      value={inputValue}
      onChange={handleChange}
      onBlur={_ => handleBlur(id)}
      onKeyPress={handleKeyPress(id)}
      ref={ReactDOM.Ref.domRef(editInput)}
    />
  </div>
}
