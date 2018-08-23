module dnum.ml;

import dnum.tensor;
import dnum.utils;
import dnum.linalg;
import dnum.stats;

import std.math;

alias TF = Tensor delegate(Tensor);

// =============================================================================
// Activation
// =============================================================================
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

class Tanh : Activation {
  Tensor opCall(Tensor x) {
    return x.fmap(t => tanh(t));
  }

  Tensor gradient(Tensor x) {
    auto y = this.opCall(x);
    return y.fmap(t => 1 - t^^2);
  }
}

// =============================================================================
// Loss
// =============================================================================
interface Loss {
  Tensor loss(Tensor y_true, Tensor y_pred);
  Tensor gradient(Tensor y_true, Tensor y_pred);
  // double acc(Tensor y_true, Tensor y_pred);
}

class SquareLoss : Loss {
  Tensor loss(Tensor y, Tensor y_pred) {
    return 0.5 * (y - y_pred)^^2;
  }

  Tensor gradient(Tensor y, Tensor y_pred) {
    return - (y - y_pred);
  }
}
