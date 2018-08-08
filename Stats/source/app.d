module app;

import dnum.tensor;
import dnum.linalg;
import dnum.utils;
import dnum.stats;

void main() {
  import std.stdio : writeln;

  auto a = Tensor([[1,2],[3,4]]);
  a.cor.writeln;
}
