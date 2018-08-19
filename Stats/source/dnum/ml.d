module dnum.ml;

import dnum.tensor;
import dnum.stats;
import dnum.utils;
import dnum.linalg;

enum Function {
  Sigmoid,
  Tanh,
  ReLU
}

interface NN {
  void hello();
}

class Sequential : NN {
  import std.stdio : writeln;

  void hello() {
    writeln("hello");
  }
}

class Activation : NN {
  import std.stdio : writeln;

  void hello() {
    writeln("hi");
  }
}

void test(NN n) {
  import std.stdio : writeln;

  n.hello;
}
