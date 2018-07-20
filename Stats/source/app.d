module app;

import data.vector;

void main() {
    import std.stdio : writeln;

    Matrix a = Matrix([[1,2],[3,4]]);
    a.writeln;
    auto bias = Matrix(cast(double)-1, a.row, 1);
    bias.writeln;
    cbind(bias, a).writeln;
}
