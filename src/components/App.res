@react.component
let make = () => {
  let greeting = "Hello World!"

  <div> {greeting->React.string} </div>
}
