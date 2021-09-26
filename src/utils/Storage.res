external recordAsJson: 'a => Js.Json.t = "%identity"

@val @scope("window")
external localStorage: 'a = "localStorage"

@val @scope(("window", "localStorage"))
external localStorageGetItem: string => option<string> = "getItem"

@val @scope(("window", "localStorage"))
external localStorageSetItem: (string, string) => unit = "setItem"

@val @scope(("window", "localStorage", "length"))
external localStorageLength: int = "length"

let isLocalStorageEmpty = () => {
  switch localStorageLength === 0 {
  | false => false
  | _ => true
  }
}

let getValueFromLocalStorage = (key: string) => {
  switch localStorageGetItem(key) {
  | Some(value) => Js.Json.parseExn(value)
  | None => Js.Json.null
  }
}

let setValueToLocalStorage = (key: string, data) => {
  switch isLocalStorageEmpty(localStorage) {
  | true => ()
  | false => localStorageSetItem(key, data->recordAsJson->Js.Json.stringify)
  }
}

module Todo = {
  external decodeAsObject: 'a => Types.Todo.state = "%identity"

  let todoKey = "__rescript_todo_key__"

  let getTodoFromLocalStorage = defaultValue => {
    let value = getValueFromLocalStorage(todoKey)

    switch Js.Json.test(value, Js.Json.Null) {
    | false => value->decodeAsObject
    | true => defaultValue
    }
  }

  let setTodoToLocalStorage = (value: Types.Todo.state) => {
    todoKey->setValueToLocalStorage(value)
  }
}
