module app;

import data.vector;
import data.tensor;

void main() {
  import std.stdio : writeln;

  auto a = Tensor([1,2,3,4],true);
  a.writeln;

  auto b = Tensor([1,2,3,4],false);
  b.writeln;

  auto c = Tensor([[1,2],[3,4]]);
  c.writeln;
}
