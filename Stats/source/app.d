module app;

import data.vector;

void main() {
  import std.stdio : writeln;

  auto a = Vector([1,2,3,4]);

  (a+1).writeln;
  (a+1).writeln;
  (a+1).writeln;
}
