import btree.{BTree}
import gleam/list
import gleam/option.{None, Some}
import gleeunit
import gleeunit/should

pub type Case(a, b) {
  Case(in: a, out: b)
}

pub fn main() {
  gleeunit.main()
}

pub fn invert_test() {
  let cases = [
    Case(in: [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15], out: [
      1, 3, 2, 7, 6, 5, 4, 15, 14, 13, 12, 11, 10, 9, 8,
    ]),
    Case(in: [1, 2, 3, 4, 5, 6, 7], out: [1, 3, 2, 7, 6, 5, 4]),
    Case(in: [4, 2, 7, 1, 3, 6, 9], out: [4, 7, 2, 9, 6, 3, 1]),
    Case(in: [2, 1, 3], out: [2, 3, 1]),
    Case(in: [], out: []),
  ]
  cases
  |> list.map(fn(c) {
    btree.invert(c.in)
    |> should.equal(c.out)
  })
}

pub fn is_univalue_test() {
  let cases = [
    Case(
      in: BTree(
        1,
        Some(BTree(1, Some(BTree(1, None, None)), Some(BTree(1, None, None)))),
        Some(BTree(1, Some(BTree(1, None, None)), Some(BTree(1, None, None)))),
      ),
      out: True,
    ),
    Case(
      in: BTree(
        1,
        Some(BTree(1, Some(BTree(1, None, None)), Some(BTree(2, None, None)))),
        Some(BTree(1, Some(BTree(1, None, None)), Some(BTree(1, None, None)))),
      ),
      out: False,
    ),
    Case(
      in: BTree(
        1,
        Some(BTree(1, Some(BTree(1, None, None)), Some(BTree(2, None, None)))),
        Some(BTree(
          1,
          None,
          Some(BTree(1, Some(BTree(1, Some(BTree(1, None, None)), None)), None)),
        )),
      ),
      out: False,
    ),
    Case(in: BTree(2, None, None), out: True),
  ]

  cases
  |> list.map(fn(c) {
    btree.is_univalue(c.in)
    |> should.equal(c.out)
  })
}
