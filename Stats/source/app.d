module app;

import data.vector;
import data.tensor;

void main() {
  import std.stdio : writeln;

  auto a = Tensor([1,2,3,4],true);
  a.writeln;


  (a + 1).writeln;
  (1 + a).writeln;
  (a + a).writeln;
  (-a).writeln;
}
