module Todo = {
  type todo = {
    id: int,
    content: string,
    completed: bool,
  }

  type todos = array<todo>
}
