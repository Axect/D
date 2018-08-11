import std.stdio : writeln;

void main() {
  auto a = Shape.Col;
  switch (a) with(Shape) {
    case Row:
      writeln("Row");
      break;
    default:
      writeln("Col");
      break;
  }
}

enum Shape {
  Row,
  Col
}
