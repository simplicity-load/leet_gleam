import gleam/string

pub fn sting_arr_eq(x: List(String), y: List(String)) -> Bool {
  let x = x |> string.join("")
  let y = y |> string.join("")
  x == y
}
