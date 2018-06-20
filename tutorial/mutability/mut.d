module tutorial.mutability.mut;

void main() {
    import std.stdio : writeln;

    int m = 100;
    writeln("m: ", typeof(m).stringof);
    m = 10;

    // const pointer to mutable memory
    // immutable pointer is not allow.
    const int* cm = &m;
    writeln("cm: ", typeof(cm).stringof);

    immutable v = 100;
    writeln("v: ", typeof(v).stringof);

    immutable int* cv = &v;
    writeln("cv: ", typeof(cv).stringof);
}