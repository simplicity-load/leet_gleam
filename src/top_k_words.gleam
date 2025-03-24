import gleam/dict.{type Dict}
import gleam/list
import gleam/order.{type Order}
import gleam/pair
import gleam/result
import gleam/string

pub fn top_k_words(input: List(String), upto: Int) -> List(String) {
  let frequency =
    input
    |> list.fold(dict.new(), insert_word_frequency)
    |> dict.to_list()
    |> list.sort(compare_word_frequency)
    |> list.map(pair.first)

  frequency
  |> list.split(upto)
  |> pair.first
}

fn insert_word_frequency(from, word) -> Dict(String, Int) {
  let word_freq = dict.get(from, word) |> result.unwrap(0)
  dict.insert(from, word, word_freq + 1)
}

fn compare_word_frequency(a: #(String, Int), b: #(String, Int)) -> Order {
  case b.1 - a.1 {
    x if x < 0 -> order.Lt
    x if x > 0 -> order.Gt
    _ -> string.compare(a.0, b.0)
  }
}
