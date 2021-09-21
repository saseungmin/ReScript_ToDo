open Types.Todo

@module("react")
external useCallback: ('a, 'b) => 'a = "useCallback"

@react.component
let make = () => {
  let setTodoState = Recoil.useSetRecoilState(Atom.todoListAtom)

  let (input, setInput) = React.useState(_ => "")
  let (error, setError) = React.useState(_ => false)

  let handleChange = e => {
    setError(_ => false)
    setInput(_ => ReactEvent.Form.target(e)["value"])
  }

  let onInsert = useCallback(e => {
    if ReactEvent.Keyboard.key(e) === "Enter" {
      let insertInput = if Js.String.trim(input) === "" {
        None
      } else {
        Some(input)
      }

      switch insertInput {
      | None => setError(_ => true)
      | Some(content) =>
        content->AddTodo->Utils.todoActions->setTodoState
        setInput(_ => "")
      }
    }
  }, [input])

  let renderError = error ? Some("Nothing was entered!") : None

  let errorElement = switch renderError {
  | Some(message) => <div> {message->React.string} </div>
  | None => React.null
  }

  <>
    <input type_="text" value=input onChange={handleChange} onKeyPress={onInsert} /> {errorElement}
  </>
}
