module app;

import data.tensor;
import data.linalg;

void main() {
  import std.stdio : writeln;


  auto b = Tensor([[1,2],[3,4]]);
  b.writeln;

  b.det.writeln;
  b.inv.writeln;
  b.writeln;
}
