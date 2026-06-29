import distgleam
import gleeunit

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn greet_test() {
  assert distgleam.greet("World") == "Hello, World!"
}
