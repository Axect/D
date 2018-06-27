module app;

import data.vector;

void main() {
    import std.stdio : writeln;
    
    auto b = Vector(1,20,2);
    b.writeln;
    b.add(1).writeln;
    b.sub(1).writeln;
    b.mul(2).writeln;
    b.div(2).writeln;
    b.pow(2).writeln;
    b.sqrt.writeln;
    b.fmap(x => 2 * x - 1).writeln;
    b.dot(b).writeln;

    auto c = Matrix(b, 1, 10);
    c.writeln;
}
