import std.stdio : writeln;

enum IntOps {
  add = 0,
  sub = 1,
  mul = 2,
  div = 3,
}

auto getMathOp(IntOps op) {
  auto add = (int lhs, int rhs) => lhs + rhs;
  auto sub = (int lhs, int rhs) => lhs - rhs;
  auto mul = (int lhs, int rhs) => lhs * rhs;
  auto div = (int lhs, int rhs) => lhs / rhs;

  final switch (op) {
    case IntOps.add:
      return add;
    case IntOps.sub:
      return sub;
    case IntOps.mul:
      return mul;
    case IntOps.div:
      return div;
  }
}

void main() {
  int a = 10;
  int b = 5;

  auto func = getMathOp(IntOps.add);
  writeln("The type of func is ", typeof(func).stringof, "!");
  writeln("result: ", func(a,b));
}
