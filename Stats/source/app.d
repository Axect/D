module app;

import data.vector;

void main() {
    import std.stdio : writeln;
    
    // auto b = Vector(1,20,2);
    // b.writeln;
    // writeln(b + 1);
    // writeln(b - 1);
    // writeln(b * 2);
    // writeln(b / 2);
    // b.sqrt.writeln;
    // b.fmap(x => 2 * x - 1).writeln;
    // b.dot(b).writeln;

    auto c = Matrix(Vector(1,10000), 100, 100, true);
    auto d = Matrix(Vector(1,10000), 100, 100, true);
    // c.writeln;
    // c[1,1].writeln;
    // writeln(c + 1);
    // writeln(c - 1);
    // writeln(c * 2);
    // writeln(c / 2);
    // writeln(c ^^ 2);
    // writeln(c + c);
    // writeln(c % c);
    // d.writeln;
    writeln(c % d);
}
