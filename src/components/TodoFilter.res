open Types.Todo

@react.component
let make = () => {
  let (_, setFilter) = Recoil.useRecoilState(Atom.todoListFilterAtom)

  let onChangeFilter = e => {
    let value = (e->ReactEvent.Form.target)["value"]

    switch value {
    | "Show All" => setFilter(_ => ShowAll)
    | "Show Completed" => setFilter(_ => ShowCompleted)
    | "Show Uncompleted" => setFilter(_ => ShowUncompleted)
    | _ => ()
    }
  }

  <div>
    {"Filter:"->React.string}
    <select onChange={onChangeFilter}>
      <option value="Show All"> {"All"->React.string} </option>
      <option value="Show Completed"> {"Completed"->React.string} </option>
      <option value="Show Uncompleted"> {"Uncompleted"->React.string} </option>
    </select>
  </div>
}
