import gleeunit
import distgleam

pub fn main() -> Nil {
  gleeunit.main()
}

pub fn greet_test() {
  assert distgleam.greet("World") == "Hello, World!"
}
