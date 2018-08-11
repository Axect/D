import std.stdio : writeln;

void main() {
  auto D = Derivative(1e-6);
  D(x => x ^^ 2)(1).writeln;
}

alias func = double delegate(double);

struct Derivative {
  double h;
  
  this(double g) {
    this.h = g;
  }

  func opCall(func f) {
    return (x => (f(x+h) - f(x-h)) / (2*h));
  }
}
