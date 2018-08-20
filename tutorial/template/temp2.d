import std.stdio;

void main() {
  auto c = Coordinate!double(1.1, 2.2, 3.3);
  c.foo2D();
}

template Point2D(T) {
  T x;
  T y;

  void foo2D() {
    writefln("Using (%s, %s)", x, y);
  }
}

struct Coordinate(T) {
  mixin Point2D!T; // Inject x, y, foo2D
  T z;

  this(T x, T y, T z) {
    this.x = x;
    this.y = y;
    this.z = z;
  }
}
