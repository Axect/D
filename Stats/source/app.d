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

  auto b = Tensor([[1,2],[3,4]]);
  b.writeln;
  b.fmap(x => x ^^ 2 + 2 * x).writeln;
  (b^^2 + 2 * b).writeln;
  (b % b).writeln;

  (a.transpose % a).writeln;
  (a % a.transpose).writeln;
}
