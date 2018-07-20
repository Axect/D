module app;

import data.vector;

void main() {
    import std.stdio : writeln;

    immutable Matrix a = Matrix([[1,2],[3,4]]);
    a.writeln;
    auto res = a.lu;
    res[1].writeln;
    a.writeln;
    res[1].invU.writeln;
    a.writeln;
}
