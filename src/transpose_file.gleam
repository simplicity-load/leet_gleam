import file_streams/file_stream.{type FileStream}
import gleam/list
import gleam/string

pub fn transpose_file(path: String) {
  let assert Ok(file) = file_stream.open_read(path)

  stream_to_list(file, [])
  |> list.map(fn(x) { string.split(x, " ") })
  |> list.transpose
}

fn stream_to_list(stream: FileStream, acc: List(String)) -> List(String) {
  let line = file_stream.read_line(stream)
  case line {
    Ok(x) -> stream_to_list(stream, list.append(acc, [x |> string.trim_end]))
    Error(_) -> acc
  }
}
