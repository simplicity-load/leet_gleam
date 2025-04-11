import gleam/string

pub fn faulty_keyboard(input: String) -> String {
  faulty_keyboard_iter(input, "")
}

fn faulty_keyboard_iter(input, acc) -> String {
  let #(first, rest) = split_at(input, 1)
  case first, rest {
    "", _ -> acc
    "i", rest -> faulty_keyboard_iter(rest, string.reverse(acc))
    x, rest -> faulty_keyboard_iter(rest, acc <> x)
  }
}

pub fn split_at(x: String, index: Int) -> #(String, String) {
  let head = string.slice(x, 0, index)
  let tail = string.slice(x, index, string.length(x))
  #(head, tail)
}
