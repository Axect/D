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

alias Layers = uint;

struct NN {
  // =====================================================
  //  Necessary Structures
  // =====================================================
  uint layers = 1; // Except Input
  uint current = 0; // Current position; smaller than layers
  int bias = -1; // Bias

  Tensor x;
  Tensor y;
  Tensor[] weights; // length = layers

  this(Tensor input, Layers l) {
    this.x = input;
    this.layers = l;
    this.current = 0;

    auto m = input.nrow;
    auto n = input.ncol;
  }

  void sequential(int m, int n);
  void activation(Activation A);
}
