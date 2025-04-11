import gleam/list

pub fn permutations(input: List(a)) {
  permutation_iter(input, 0)
}

fn permutation_iter(input: List(a), index: Int) -> List(List(a)) {
  case input {
    [x] -> [[x]]
    [x, y] -> [[x, y], [y, x]]
    _ ->
      input
      |> list.fold([], fn(acc, v) -> List(List(a)) {
        let permutated =
          permutation_iter(input |> list.filter(fn(x) { v != x }), index + 1)
        let joined = list.map(permutated, fn(p) { [v, ..p] })
        list.append(acc, joined)
      })
  }
}
