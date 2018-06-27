module app;

import data.vector;

void main() {
    import std.stdio : writeln;
    
    auto b = Vector(1,20,2);
    b.writeln;
    writeln(b + 1);
    writeln(b - 1);
    writeln(b * 2);
    writeln(b / 2);
    b.sqrt.writeln;
    b.fmap(x => 2 * x - 1).writeln;
    b.dot(b).writeln;

    auto c = Matrix([1,2,3,4], 2, 2, true);
    c.writeln;
    c[1,1].writeln;
    writeln(c + 1);
    writeln(c - 1);
    writeln(c * 2);
    writeln(c / 2);
    writeln(c + c);
}
