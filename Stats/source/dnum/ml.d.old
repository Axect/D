module dnum.ml;

import dnum.tensor;
import dnum.utils;
import dnum.linalg;
import dnum.stats;

import std.math;

alias TF = Tensor delegate(Tensor);

// =============================================================================
// Layers
// =============================================================================
interface Layer {
  void set_input_shape(Size shape);
  int parameters();
  Tensor forward_pass(Tensor X, bool training);
  Tensor backward_pass(Tensor accum_grad);
  Size output_shape();
}

/++
  A Fully Connected NN Layer
+/
class Dense : Layer {
  Tensor layer_input, w, w0;
  Optimizer w_opt, w0_opt;
  Size input_shape;
  int n_units; // number of neurons in layer
  bool trainable;

  this(int n_units, Size input_shape) {
    this.input_shape = input_shape;
    this.n_units = n_units;
  }

  void initialize(Optimizer optimizer) {
    auto limit = 1 / sqrt(this.input_shape.row);
    auto range = Range(-limit, limit);
    auto shape = Size(this.input_shape.row, this.n_units);
    this.w = rand(shape, range);
    this.w_opt = optimizer;
    this.w0_opt = optimizer;
  }

  int parameters() {
    return this.w.nrow * this.w.ncol + this.w0.nrow * this.w0.ncol;
  }

  Tensor forward_pass(Tensor X, bool training = true) {
    this.layer_input = X;
    return X % this.w + this.w0;
  }

  Tensor backward_pass(Tensor accum_grad) {
    auto w = Tensor(this.w);

    if (this.trainable) {
      auto grad_w = this.layer_input.t % accum_grad;
      auto grad_w0 = accum_grad.csum;

      this.w = this.w_opt.update(this.w, grad_w);
      this.w0 = this.w0_opt.update(this.w0, grad_w0);
    }
  }
}

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
  double acc(Tensor y_true, Tensor y_pred);
}

class SquareLoss : Loss {
  Tensor loss(Tensor y, Tensor y_pred) {
    return 0.5 * (y - y_pred)^^2;
  }

  Tensor gradient(Tensor y, Tensor y_pred) {
    return - (y - y_pred);
  }
}