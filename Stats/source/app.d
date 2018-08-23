module app;

import dnum.tensor;
import dnum.linalg;
import dnum.utils;
import dnum.stats;
import dnum.csv;

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

  auto d = runif(5, r);
  d.writeln;
  
  // CSV
  //auto df = readcsv("test.csv", true);
  //df.writeln;
  //writecsv("test2.csv", df, true);
}
