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

    // auto c = Matrix([1,2,3,4], 2, 2, true);
    // auto d = Matrix([1,2,3,4,5,6], 2, 3, true);
    // c.writeln;
    // c.transpose.writeln;
    // c[1,1].writeln;
    // writeln(c + 1);
    // writeln(c - 1);
    // writeln(c * 2);
    // writeln(c / 2);
    // writeln(c ^^ 2);
    // writeln(c + c);
    // writeln(c % c);
    // d.writeln;
    // writeln(c % d);

    auto m = Matrix([[2, -1, -2], [-4, 6, 3], [-4, -2, 8]]);
    m.writeln;
    // auto res = m.lu();
    // Matrix l = res[0];
    // Matrix u = res[1];
    // l.writeln;
    // u.writeln;
    m.block(1).writeln;
    m.block(2).writeln;
    m.block(3).writeln;
    m.block(4).writeln;
    // c.det.writeln;
    // m.det.writeln;
    
    auto L = Matrix([[1,0,0],[2,1,0],[3,4,1]]);
    L.invL.writeln;

    auto U = Matrix([[1,2,3], [0, 1, 5], [0, 0, 2]]);
    U.invU.writeln;
}
