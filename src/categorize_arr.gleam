import faulty_keyboard
import gleam/list

pub fn categorize_str_to_tuples(input: String) -> List(#(String, Int)) {
  categorize_str_to_tuples_iter(input, #("", 0), [])
  |> list.reverse
}

fn categorize_str_to_tuples_iter(
  input: String,
  last: #(String, Int),
  acc: List(#(String, Int)),
) {
  let #(first, rest) = faulty_keyboard.split_at(input, 1)

  // let #(tuple, combined) = case first, last {
  //   x, #(y, count) if x == y -> #(#(y, count +1),acc)
  //   x, #("", _) if x != "" -> #(#(x,1), acc)
  //   x, _ if x != "" ->  #(#(x,1), [last, ..acc])
  //   _, _ -> #(last, [last,..acc])
  // }
  case first, last {
    x, #(y, count) if x == y ->
      categorize_str_to_tuples_iter(rest, #(y, count + 1), acc)
    x, #("", _) if x != "" -> categorize_str_to_tuples_iter(rest, #(x, 1), acc)
    x, _ if x != "" ->
      categorize_str_to_tuples_iter(rest, #(x, 1), [last, ..acc])
    _, _ -> [last, ..acc]
  }
}
