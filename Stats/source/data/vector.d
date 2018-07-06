module data.vector;

import std.stdio : writeln;

/++
  Vector is default class for Statistics
+/
struct Vector {
  import std.math : sqrt;
  
  double[] comp;

  // ===========================================================================
  // Constructor
  // ===========================================================================
  /++
    Like iota
  +/
  this(double start, double end, double step = 1) {
    long l = cast(long)((end - start + 1) / step);
    this.comp.length = l;
    foreach(i; 0 .. l) {
      this.comp[i] = start + cast(double)i * step;
    }
  }

  /++
    Uninitialized
  +/
  this(long l) {
    this.comp.length = l;
  }

  /++
    array to Vector
  +/
  this(double[] vec) {
    this.comp = vec;
  }

  void toString(scope void delegate(const(char)[]) sink) const {
    import std.stdio : write;

    sink("Vector ");
    this.comp.write;
  }

  // ===========================================================================
  // Basic Operator
  // ===========================================================================
  pure long length() const {
    return this.comp.length;
  }
  
  // ===========================================================================
  //    Void Functions
  // ===========================================================================
  void add_void(T)(T x) {
    auto X = cast(double)x;
    foreach(i; 0 .. this.comp.length) {
      this.comp[i] += X;
    }
  }

  void sub_void(T)(T x) {
    auto X = cast(double)x;
    foreach(i; 0 .. this.comp.length) {
      this.comp[i] -= X;
    }
  }

  void mul_void(T)(T x) {
    auto X = cast(double)x;
    foreach(i; 0 .. this.comp.length) {
      this.comp[i] *= X;
    }
  }

  void div_void(T)(T x) {
    auto X = cast(double)x;
    foreach(i; 0 .. this.comp.length) {
      this.comp[i] /= X;
    }
  }

  void pow_void(T)(T x) {
    auto X = cast(double)x;
    foreach(i; 0 .. this.comp.length) {
      this.comp[i] ^^= X;
    }
  }

  void sqrt_void() {
    foreach(i; 0 .. this.comp.length) {
      this.comp[i] = sqrt(this.comp[i]);
    }
  }

  // TODO: What is it delegate
  void fmap_void(double delegate(double) f) {
    foreach(i; 0 .. this.comp.length) {
      this.comp[i] = f(this.comp[i]);
    }
  }

  // ===========================================================================
  //    Vector Function
  // ===========================================================================
  Vector fmap(double delegate(double) f) {
    Vector that = Vector(comp);
    that.fmap_void(f);
    return that;
  }

  const double mapReduce(double delegate(double) f) {
    double s = 0;
    foreach(e; this.comp) {
      s += f(e);
    }
    return s;
  }

  Vector sqrt() {
    return this.fmap(t => t.sqrt);
  }
  // ===========================================================================
  // Operator Overloading
  // ===========================================================================
  /++
    Getter
  +/
  double opIndex(size_t i) const {
    return this.comp[i];
  }

  /++
    Setter
  +/
  void opIndexAssign(double value, size_t i) {
    this.comp[i] = value;
  }

  /++
    Binary Operator with Scalar
  +/
  Vector opBinary(string op)(double rhs) {
    Vector temp = Vector(this.comp);
    switch(op) {
      case "+":
        temp.add_void(rhs);
        break;
      case "-":
        temp.sub_void(rhs);
        break;
      case "*":
        temp.mul_void(rhs);
        break;
      case "/":
        temp.div_void(rhs);
        break;
      case "^^":
        temp.pow_void(rhs);
        break;
      default:
        break;
    }
    return temp;
  }

  /++
    Binary Operator with Vector
  +/
  Vector opBinary(string op)(Vector rhs) {
    Vector temp = Vector(this.comp);
    switch(op) {
      case "+":
        foreach(i; 0 .. temp.length) {
          temp.comp[i] += rhs.comp[i];
        }
        break;
      case "-":
        foreach(i; 0 .. temp.length) {
          temp.comp[i] -= rhs.comp[i];
        }
        break;
      case "*":
        foreach(i; 0 .. temp.length) {
          temp.comp[i] *= rhs.comp[i];
        }
        break;
      case "/":
        foreach(i; 0 .. temp.length) {
          temp.comp[i] /= rhs.comp[i];
        }
        break;
      default:
        break;
    }
    return temp;
  }

  /++
    Inner Product
  +/
  double dot(Vector rhs) {
    double s = 0;
    foreach(i; 0 .. this.comp.length) {
      s += cast(double)this[i] * cast(double)rhs[i];
    }
    return s;
  }

  // ===========================================================================
  // Statistics Operator
  // ===========================================================================
  pure double sum() const {
    double s = 0;
    foreach(e; this.comp) {
      s += e;
    }
    return s;
  }
  
  pure double mean() const {
    double s = 0;
    double l = 0;
    foreach(e; this.comp) {
      l++;
      s += e;
    }
    return s / l;
  }

  pure double var() const {
    double m = 0;
    double l = 0;
    double v = 0;
    foreach(e; this.comp) {
      l++;
      m += e;
      v += e ^^ 2;
    }
    return (v / l - (m / l)^^2) * l / (l - 1);
  }

  pure double std() const {
    return sqrt(var);
  }
}

// =============================================================================
// Matrix
// =============================================================================
/++
  Matrix Structure
+/
struct Matrix {
  import std.array : join;
  import std.parallelism : taskPool, parallel; // Perfect Parallel!

  Vector val;
  long row;
  long col;
  bool byRow;
  double[][] data;
  
  // ===========================================================================
  // Constructor
  // ===========================================================================
  this(double[] vec, long r, long c, bool byrow = false) {
    this.val = Vector(vec);
    this.row = r;
    this.col = c;
    this.byRow = byrow;
    this.data = this.matForm; // heavy cost
  }

  /++
    Uninitialized Matrix
  +/
  this(long r, long c, bool byrow = false) {
    this.val = Vector(r*c);
    this.row = r;
    this.col = c;
    this.byRow = byrow;
    this.data = this.matForm;
  }

  this(Vector vec, long r, long c, bool byrow = false) {
    this.val = vec;
    this.row = r;
    this.col = c;
    this.byRow = byrow;
    this.data = this.matForm; // heavy cost
  }

  this(double[][] mat) {
    this.val = Vector(mat.join); // join is cheap
    this.row = mat.length;
    this.col = mat[0].length;
    this.byRow = true;
    this.data = mat; // no cost
  }

  this(Matrix mat) {
    this.val = mat.val;
    this.row = mat.row;
    this.col = mat.col;
    this.byRow = mat.byRow;
    this.data = mat.data;
  }

  // ===========================================================================
  // String
  // ===========================================================================
  void toString(scope void delegate(const(char)[]) sink) const {
    import std.stdio : write;

    sink("Matrix ");
    this.data.write;
  }

  double[][] matForm() const {
    long c = this.col;
    long r = this.row;
    double[][] mat;
    mat.length = r;

    if (byRow) {
      foreach(i; 0 .. r) {
        mat[i].length = c;
        foreach(j; 0 .. c) {
          long k = c*i + j;
          mat[i][j] = this.val[k];
        }
      }
    } else {
      foreach(j; 0 .. c) {
        foreach(i; 0 .. r) {
          mat[i].length = c;
          long k = r*j + i;
          mat[i][j] = this.val[k];
        }
      }
    }
    return mat;
  }

  /++
    Reduce cost
  +/
  void refresh() {
    this.data = this.matForm;
  }
  // ===========================================================================
  // Operator Overloading
  // ===========================================================================
  /++
    Getter
  +/
  double opIndex(size_t i, size_t j) const {
    return this.data[i][j];
  }

  /++
    Setter
  +/
  void opIndexAssign(double value, size_t i, size_t j) {
    this.data[i][j] = value;
  }

  /++
    Binary Operator with Scalar
  +/
  Matrix opBinary(string op)(double rhs) {
    Matrix temp = Matrix(this.data); // No Cost
    switch(op) {
      case "+":
        temp.val.add_void(rhs);
        break;
      case "-":
        temp.val.sub_void(rhs);
        break;
      case "*":
        temp.val.mul_void(rhs);
        break;
      case "/":
        temp.val.div_void(rhs);
        break;
      case "^^":
        temp.val.pow_void(rhs);
        break;
      default:
        break;
    }
    temp.refresh;
    return temp;
  }

  /++
    Binary Operator with Matrix
  +/
  Matrix opBinary(string op)(Matrix rhs) {
    Matrix temp = Matrix(this.val, this.row, this.col, this.byRow); // Guess heavy cost but..
    switch(op) {
      case "+":
        foreach(i; 0 .. temp.val.length) {
          temp.val.comp[i] += rhs.val.comp[i];
        }
        break;
      case "-":
        foreach(i; 0 .. temp.val.length) {
          temp.val.comp[i] -= rhs.val.comp[i];
        }
        break;
      case "*":
        foreach(i; 0 .. temp.val.length) {
          temp.val.comp[i] *= rhs.val.comp[i];
        }
        break;
      case "/":
        foreach(i; 0 .. temp.val.length) {
          temp.val.comp[i] /= rhs.val.comp[i];
        }
        break;
      case "%": // Parallel Multiplication
        assert(this.col == rhs.row);
        
        auto m = this.data;
        auto n = rhs.data;
        auto l1 = this.row;
        auto l2 = rhs.col;

        Matrix temp2 = Matrix(l1, l2, this.byRow); // Uninitialized Matrix
        auto target = temp2.data;

        foreach(i, ref rows; taskPool.parallel(target)) {
          foreach(j; 0 .. l2) {
            double s = 0;
            foreach(k; 0 .. this.col) {
              s += m[i][k] * n[k][j];
            }
            rows[j] = s;
          }
        }
        temp = Matrix(target);
        break;
      default:
        break;
    }
    temp.refresh;
    return temp;
  }

  /++
    Matrix Utils
  +/
  Matrix transpose() { // Parallel
    auto l1 = this.row;
    auto l2 = this.col;
    auto m = this.data;
    Matrix temp = Matrix(l2, l1, this.byRow); // Uninitialized
    auto target = temp.data;
    foreach(i, ref rows; taskPool.parallel(target)) {
      foreach(j; 0 .. l1) {
        rows[j] = m[j][i];
      }
    }
    temp = Matrix(target);
    return temp;
  }

  import std.typecons : tuple;

  auto lu() {
    auto n = this.row;
    assert(this.row == this.col);

    double[][] m = this.data;
    double[][] u = zerosMat(n,n);
    double[][] l = eyeMat(n);
    u[0] = m[0];

    foreach(i; 0 .. n) {
      foreach(k; i .. n) {
        double s = 0;
        foreach(j; 0 .. i) {
          s += l[i][j] * u[j][k];
        }
        u[i][k] = m[i][k] - s;
      }

      foreach(k; i+1 .. n) {
        double s = 0;
        foreach(j; 0 .. i) {
          s += l[k][j] * u[j][i];
        }
        l[k][i] = (m[k][i] - s) / u[i][i];
      }
    }
    Matrix L = Matrix(l);
    Matrix U = Matrix(u);
    return tuple(L, U);
  }
}

double[][] initMat(long r, long c) {
  double[][] m;
  m.length = r;
  foreach(i; 0 .. r) {
    m[i].length = c;
  }
  return m;
}

double[][] eyeMat(long l) {
  double[][] m = zerosMat(l, l);
  foreach(i; 0 .. l) {
    m[i][i] = 1;
  }
  return m;
}

double[][] zerosMat(long r, long c) {
  double[][] m = initMat(r, c);
  foreach(i, ref rows; m) {
    foreach(j; 0 .. c) {
      rows[j] = 0;
    }
  }
  return m;
}