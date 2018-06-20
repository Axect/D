struct FibonacciRange {
  int a = 1, b = 1;

  enum empty = false;

  int front() const @property {
    return a;
  }

  void popFront() {
    auto t = a;
    a = b;
    b = t + b;
  }
}

void main() {
  FibonacciRange fib;

  import std.range : drop, generate, take;
  import std.algorithm.iteration : filter, sum;
  import std.stdio : writeln;

  auto fib10 = fib.take(10);
  writeln("Fib 10: ", fib10);

  auto fib5 = fib10.drop(5);
  writeln("Fib 5: ", fib5);

  auto fibEven = fib5.filter!(x => x%2);
  writeln("FibEven : ", fibEven);

  writeln("Sum of FibEven: ", fibEven.sum);

  fib.take(10)
    .drop(5)
    .filter!(x => x%2)
    .sum
    .writeln;
}
