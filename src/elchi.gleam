import gleam/bytes_builder.{type BytesBuilder}
import gleam/erlang/process
import gleam/http/cowboy
import gleam/http/request.{type Request}
import gleam/http/response.{type Response}

pub fn hello(_request: Request(t)) -> Response(BytesBuilder) {
  let body = bytes_builder.from_string("Hello, world!")

  response.new(200)
  |> response.set_body(body)
}

pub fn main() {
  cowboy.start(hello, on_port: 8080)
  process.sleep_forever()
}
