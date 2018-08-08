module app;

import data.tensor;
import data.linalg;
import data.utils;
import data.stats;

void main() {
  import std.stdio : writeln;


  auto b = Tensor([[1,2],[3,4]]);
  b.writeln;

  b.det.writeln;
  b.inv.writeln;
  b.writeln;

  auto a = Tensor([1,2,3,4]);
  a.writeln;
  auto c = Tensor([1,2,3,4], false);
  c.writeln;

  cbind(a,a).writeln;
  rbind(a,a).writeln;

  cbind(a,a,a).writeln;
  rbind(a,a,a).writeln;

  cov(c,c).writeln;
}
