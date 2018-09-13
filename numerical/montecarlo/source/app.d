import std.stdio : writeln;
import dnum.tensor;
import dnum.utils;
import dnum.stats;

void main() {
  import std.math : PI, abs;

  int n = 100000000;
  auto a = rand(1,n);
  auto b = rand(1,n);
  auto c = rand(1,n);

  double s = 0;
  foreach (i; 0 .. n) {
    if (a[0,i]^^2 + b[0,i]^^2 + c[0,i]^^2 <= 1) {
      s++;
    }
  }
  
  auto estimate = s / cast(double)n * 8;
  auto actual = 4.0/3.0*PI;

  writeln("Estimate Volume: ", estimate);
  writeln("Actual Volume:   ", actual);
  writeln("Error (%):       ", abs(estimate - actual) / actual * 100);
}
