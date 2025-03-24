import gleam/io
import transpose_file

pub fn main() {
  io.debug("hello world :D")
  // echo top_k_words.top_k_words(
  //   [
  //     "the", "the", "i", "love", "word", "love", "i", "sus", "za", "zb", "za",
  //     "zb",
  //   ],
  //   8,
  // )
  // echo top_k_words.top_k_words(
  //   ["day", "is", "sunny", "the", "the", "the", "sunny", "is", "is"],
  //   4,
  // )
  echo transpose_file.transpose_file("./src/file.txt")
}
