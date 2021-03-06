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
  a[Range(0,1), Range(1,1)].writeln;

  auto c = rand(4,3);
  c.writeln;

  auto r = Range(-1, 1);

  auto d = runif(5, r);
  d.writeln;
  
  // CSV
  //auto df = readcsv("test.csv", true);
  //df.writeln;
  //writecsv("test2.csv", df, true);

  // Linear Regression
  auto x = Tensor(Range(1, 10));
  auto y = 2*x + runif(10, Range(-2, 2));
  auto l = LinReg(x, y);
  x.writeln;
  l.writeln;
  l(x).writeln;

  // Sequence, take, takeWhile
  auto g = seq(1,10);
  g.writeln;
  g.take(5).writeln;
  g.takeWhile(x => x < 6).writeln;

  // zipWith
  auto f = seq(1,5);
  zipWith((x,y) => x + y, f, g).writeln;
}
