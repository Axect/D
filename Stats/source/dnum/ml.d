module dnum.ml;

import dnum.tensor;
import dnum.stats;
import dnum.utils;
import dnum.linalg;

enum Activation {
  Sigmoid,
  Tanh,
  ReLU
}

struct NN {
  uint layers = 1;
  uint current = 0;
  Tensor input;
  Tensor output;
  Tensor[] weights;

  void sequential(int m, int n);
  void activation(Activation A);
}
