module app;

import data.vector;

void main() {
    import std.stdio : writeln;

    Matrix a = Matrix([[1,2],[3,4]]);
    a.writeln;
    auto res = a.lu;
    res[1].writeln;
    a.writeln;
    res[1].invU.writeln;
    a.writeln;
    a.inv.writeln;
    a.writeln;
}
