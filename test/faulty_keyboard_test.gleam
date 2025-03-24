import btree_test.{Case}
import faulty_keyboard
import gleam/list
import gleeunit
import gleeunit/should

pub fn main() {
  gleeunit.main()
}

pub fn faulty_keyboard_test() {
  let cases = [
    Case("string", "rtsng"),
    Case("poiinter", "ponter"),
    Case("abcde", "abcde"),
    Case("hello", "hello"),
    Case("input", "nput"),
    Case("abci", "cba"),
    Case("aibi", "ba"),
    Case("testi", "tset"),
  ]
  cases
  |> list.map(fn(c) {
    faulty_keyboard.faulty_keyboard(c.in)
    |> should.equal(c.out)
  })
}
