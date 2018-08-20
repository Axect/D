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

  int input;
  int output;

  this(int m, int n) {
    this.input = m;
    this.output = n;
  }

  void hello() {
    writeln("hello");
  }
}

class Activation : NN {
  import std.stdio : writeln;

  Function act;

  this(Function f) {
    this.act = f;
  }

  void hello() {
    writeln("hi");
  }
}

void test(NN[] n...) {
  import std.stdio : writeln;

  foreach (ref m; n) {
    m.hello();
  }
}
