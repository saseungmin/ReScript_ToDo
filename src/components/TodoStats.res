open WithStats

@react.component
let make = () => {
  let {totalNum, totalCompletedNum, totalUncompletedNum, percentCompleted} = Recoil.useRecoilValue(
    todoWithStats,
  )

  let formattedPercentCompleted = Js.Math.round(percentCompleted *. 100.0)

  let convertToString = num => num->Js.Int.toString

  <section>
    <div> {`Total items: ${convertToString(totalNum)}`->React.string} </div>
    <div> {`Items completed: ${convertToString(totalCompletedNum)}`->React.string} </div>
    <div> {`Items not completed: ${convertToString(totalUncompletedNum)}`->React.string} </div>
    <div>
      {`Percent completed: ${formattedPercentCompleted->Js.Float.toString}%`->React.string}
    </div>
  </section>
}
