import std.stdio : writeln;
import std.random;

void main() {
  import std.math : PI, abs;

  auto estimate = roll(10);
  auto actual = 4.0/3.0*PI;

  writeln("------------------------------");
  writeln("           10^1 times         ");
  writeln("------------------------------");
  writeln("Estimate Volume: ", estimate);
  writeln("Actual Volume:   ", actual);
  writeln("Error (%):       ", abs(estimate - actual) / actual * 100);

  estimate = roll(100);
  writeln("------------------------------");
  writeln("           10^2 times         ");
  writeln("------------------------------");
  writeln("Estimate Volume: ", estimate);
  writeln("Actual Volume:   ", actual);
  writeln("Error (%):       ", abs(estimate - actual) / actual * 100);

  estimate = roll(10000);
  writeln("------------------------------");
  writeln("           10^4 times         ");
  writeln("------------------------------");
  writeln("Estimate Volume: ", estimate);
  writeln("Actual Volume:   ", actual);
  writeln("Error (%):       ", abs(estimate - actual) / actual * 100);

  estimate = roll(1000000);
  writeln("------------------------------");
  writeln("           10^6 times         ");
  writeln("------------------------------");
  writeln("Estimate Volume: ", estimate);
  writeln("Actual Volume:   ", actual);
  writeln("Error (%):       ", abs(estimate - actual) / actual * 100);

  estimate = roll(100000000);
  writeln("------------------------------");
  writeln("           10^8 times         ");
  writeln("------------------------------");
  writeln("Estimate Volume: ", estimate);
  writeln("Actual Volume:   ", actual);
  writeln("Error (%):       ", abs(estimate - actual) / actual * 100);
}

double roll(int n) {
  auto rnd = Random(unpredictableSeed);

  double s = 0;
  double a, b, c;
  foreach (i; 0 .. n) {
    a = uniform(0.0, 1.0, rnd);
    b = uniform(0.0, 1.0, rnd);
    c = uniform(0.0, 1.0, rnd);
    if (a ^^ 2 + b ^^ 2 + c ^^ 2 <= 1) {
      s++;
    }
  }
  return s / cast(double)n * 8;
}
