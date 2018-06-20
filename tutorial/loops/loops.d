import std.stdio : writeln;

double average(int[] array) {
  immutable initialLength = array.length;
  double accumulator = 0.0;
  while (array.length) {
    accumulator += array[0];
    array = array[1 .. $];
  }

  return accumulator / initialLength;
}

void main() {
  auto testers = [ [5, 15],
                   [2, 3, 2, 3],
                   [3, 6, 2, 9] ];

  for (auto i = 0; i < testers.length; ++i) {
    writeln("The average of ", testers[i],
        " = ", average(testers[i]));
  }
}
