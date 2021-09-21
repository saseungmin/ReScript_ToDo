open Belt

type stats = {
  totalNum: int,
  totalCompletedNum: int,
  totalUncompletedNum: int,
  percentCompleted: float,
}

let todoWithStats = Recoil.selector({
  key: "todoWithStats",
  get: ({get}) => {
    let {todos} = get(Atom.todoListAtom)
    let totalNum = todos->Array.length
    let totalCompletedNum = todos->Array.keep(todo => todo.completed)->Array.length
    let totalUncompletedNum = totalNum - totalCompletedNum
    let percentCompleted =
      totalNum === 0 ? 0.0 : totalCompletedNum->Float.fromInt /. totalNum->Float.fromInt

    {
      totalNum: totalNum,
      totalCompletedNum: totalCompletedNum,
      totalUncompletedNum: totalUncompletedNum,
      percentCompleted: percentCompleted,
    }
  },
})
