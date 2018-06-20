void main() {
  import std.stdio : writefln;

  auto arr = [
    [5, 15],
    [2, 3, 2, 3],
    [3, 6, 2, 9],
  ];

  foreach (i, row; arr) {
    double total = 0.0;
    foreach (e; row)
      total += e;

    auto avg = total / row.length;
    writefln("AVG [row=%d]: %.2f", i, avg);
  }
}
