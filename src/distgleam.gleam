import gleam/io

pub fn main() -> Nil {
  io.println("Hello from distgleam!")
}

pub fn greet(name: String) -> String {
  "Hello, " <> name <> "!"
}
