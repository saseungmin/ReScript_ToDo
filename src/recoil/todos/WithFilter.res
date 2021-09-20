open Atom
open Belt

let todoWithFilter = Recoil.selector({
  key: "todoWithFilter",
  get: ({get}) => {
    let filter = get(todoListFilterAtom)
    let state = get(todoListAtom)

    switch filter {
    | ShowAll => state.todos
    | ShowCompleted => state.todos->Array.keep(todo => todo.completed)
    | ShowUncompleted => state.todos->Array.keep(todo => !todo.completed)
    }
  },
})
