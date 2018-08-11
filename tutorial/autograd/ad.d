import std.stdio : write, writeln;
import std.math : sin, cos, tan, PI, exp, log;

void main() {
  //auto x = Dual(1, 1);
  //(x^^2 + 2*x + 1).writeln;
  write("Y = ");
  auto y = Dual(0, 1);
  y.writeln;
  write("sin Y = ");
  sin(y).writeln;
  write("cos Y = ");
  cos(y).writeln;
  write("tan Y = ");
  tan(y).writeln;
  write("sin Y * cos Y = ");
  f(y).writeln;

  write("Z = ");
  auto z = Dual(1,1);
  z.writeln;
  write("exp Z = ");
  exp(z).writeln;
  write("log Z = ");
  log(z).writeln;
  write("sigmoid Z = ");
  sigmoid(z).writeln;
}

Dual f(Dual t) {
  return sin(t) * cos(t);
}

Dual sigmoid(Dual t) {
  return 1 / (1 + exp(-t));
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
        dval = (this.dx * rhs.x - this.x * rhs.dx) / (rhs.x ^^ 2);
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

Dual tan(Dual t) {
  auto x = t.x;
  auto dx = t.dx;
  return Dual(tan(x), (1 / cos(x))^^2 * dx);
}

Dual exp(Dual t) {
  auto x = t.x;
  auto dx = t.dx;
  return Dual(exp(x), exp(x) * dx);
}

Dual log(Dual t) {
  assert(t.x > 0, "Invalid domain (Log)");
  auto x = t.x;
  auto dx = t.dx;
  return Dual(log(x), dx/x);
}
