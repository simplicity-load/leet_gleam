import gleam/int
import gleam/list
import gleam/option.{type Option, None, Some}

pub type BTree(a) {
  BTree(value: a, left: Option(BTree(a)), right: Option(BTree(a)))
}

// Primitive Binary Tree
type PBTree =
  List(Int)

pub fn invert(tree: PBTree) -> PBTree {
  invert_iter(tree, 0, [])
  |> list.reverse
}

fn invert_iter(tree: PBTree, count: Int, acc: PBTree) -> PBTree {
  let node_count = int.bitwise_shift_left(1, count)
  case list.split(tree, node_count) {
    #([], _) -> acc
    #(nodes, rest) -> {
      let inv = list.append(nodes, acc)
      invert_iter(rest, count + 1, inv)
    }
  }
}

pub fn is_univalue(tree: BTree(a)) -> Bool {
  is_univalue_iter(Some(tree), tree.value)
}

fn is_univalue_iter(tree: Option(BTree(a)), value: a) -> Bool {
  case tree {
    None -> True
    Some(BTree(x, left, right)) ->
      x == value
      && is_univalue_iter(left, value)
      && is_univalue_iter(right, value)
  }
}
