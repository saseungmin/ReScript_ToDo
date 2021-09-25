@val @scope("window")
external localStorage: 'a = "localStorage"

@val @scope(("window", "localStorage"))
external localStorageGetItem: string => option<string> = "getItem"

@val @scope(("window", "localStorage"))
external localStorageSetItem: (string, string) => unit = "setItem"

@val @scope(("window", "localStorage", "length"))
external localStorageLength: int = "length"

let localStorageKey = "__rescript_todo_key__"

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

let setValueToLocalStorage = (key: string, data: string) => {
  switch isLocalStorageEmpty(localStorage) {
  | true => ()
  | false => localStorageSetItem(key, data)
  }
}
