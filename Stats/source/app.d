module app;

import dnum.tensor;
import dnum.linalg;
import dnum.utils;
import dnum.stats;

void main() {
  import std.stdio : writeln;

  auto a = Tensor([[1,2],[3,4]]);
  a.cor.writeln;

  auto b = Tensor([1,2,3,4], Shape.Col);
  b.writeln;
  b.transpose.writeln;

  auto c = rand(4,3);
  c.writeln;

  auto r = Range(-1, 1);
  auto s = Size(4, 3);

  auto d = runif(5, r);
  d.writeln;

  auto f = rand(s, r);
  f.writeln;
}
