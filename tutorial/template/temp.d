import std.stdio : writeln;

// generic template
auto add(T)(T lhs, T rhs) {
  return lhs + rhs;
}

// Template Class
class Animal(string noise) {
  void makeNoise() {
    writeln(noise ~ "!");
  }
}

// Inherit
class Dog: Animal!("Woof") {
}

class Cat: Animal!("Meeoauw") {
}

void multipleNoise(T)(T animal, int n) {
  for (int i = 0; i < n; ++i) {
    animal.makeNoise();
  }
}

void main() {
  // Explicit use
  writeln(add!int(5,10));

  // Implicit use
  int a = 5; int b = 10;
  writeln(add(5, 10));

  auto dog = new Dog;
  auto cat = new Cat;
  multipleNoise(dog, 5);
  multipleNoise(cat, 5);
}
