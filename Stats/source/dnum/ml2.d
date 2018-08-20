module dnum.ml2;

import dnum.tensor;
import dnum.utils;
import dnum.linalg;
import dnum.stats;

import std.math;

alias TF = Tensor delegate(Tensor);

interface Activation {
  Tensor opCall(Tensor x);
  Tensor gradient(Tensor x);
}

class Sigmoid : Activation {
  Tensor opCall(Tensor x) {
    return x.fmap(t => 1 / (1 + exp(-t)));
  }

  Tensor gradient(Tensor x) {
    auto y = this.opCall(x);
    return y.fmap(t => t * (1 - t));
  }
}

