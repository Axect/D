import std.stdio : writeln;

void main() {
  auto x = Dual(1, 1);
  (x^^2 + 2*x).writeln;
  auto y = Dual(0, 1);
  sin(y).writeln;
  cos(y).writeln;
}

struct Dual {
  import std.math : log;

  double x;
  double dx;

  this(double a, double b) {
    this.x = a;
    this.dx = b;
  }

  Dual opUnary(string op)() {
    double val;
    double dval;

    switch (op) {
      case "-":
        val = -this.x;
        dval = -this.dx;
        break;
      default:
        break;
    }
    return Dual(val, dval);
  }
  
  /++
    Binary Operation with Scalar
  +/
  Dual opBinary(string op)(double rhs) {
    return opBinary!(op)(Dual(rhs, 0));
  }

  Dual opBinaryRight(string op)(double lhs) {
    auto temp = Dual(lhs, 0);
    return temp.opBinary!(op)(this);
  }

  /++
    Binary Operation of Duals
  +/
  Dual opBinary(string op)(Dual rhs) {
    double val;
    double dval;

    switch (op) {
      case "+":
        val = this.x + rhs.x;
        dval = this.dx + rhs.dx;
        break;
      case "-":
        val = this.x - rhs.x;
        dval = this.dx - rhs.dx;
        break;
      case "*":
        val = this.x * rhs.x;
        dval = this.dx * rhs.x + this.x * rhs.dx;
        break;
      case "/":
        val = this.x / rhs.x;
        dval = (this.dx * rhs.x - this.x * rhs.dx) / (rhs.dx ^^ 2);
        break;
      case "^^":
        val = this.x ^^ rhs.x;
        double dx1 = this.dx;
        double dx2 = rhs.dx;
        if (dx2 == 0) {
          dval = rhs.x * this.x ^^ (rhs.x - 1) * dx1;
        } else {
            if (dx1 == 0) {
              dval = this.x ^^ rhs.x * log(rhs.x) * dx2;
            } else {
              dval = dx2 ^^ log(this.x) + rhs.x * dx1 / this.x;
            }
        }
        break;
      default:
        break;
    }
    return Dual(val, dval);
  }
}
// =============================================================================
// AD for special functions
// =============================================================================
import std.math : sin, cos;

Dual sin(Dual t) {
  auto x = t.x;
  auto dx = t.dx;
  return Dual(sin(x), cos(x) * dx);
}

Dual cos(Dual t) {
  auto x = t.x;
  auto dx = t.dx;
  return Dual(cos(x), -sin(x) * dx);
}
