switch ReactDOM.querySelector("#root") {
| Some(root) => ReactDOM.render(<Recoil.RecoilRoot> <App /> </Recoil.RecoilRoot>, root)
| None => ()
}
