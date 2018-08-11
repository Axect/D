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
  test(a);
}

enum Shape {
  Row,
  Col
}

void test(Shape a) {
  if (a == Shape.Row) {
    writeln("Row");
  } else {
    writeln("Col");
  }
}
