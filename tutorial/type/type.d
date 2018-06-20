module tutorial.type.type;

void main(string[] args) {
    import std.stdio : writeln;

    const int b = 7_000_000;
    short c = cast(short) b; // int -> short : Need cast
    uint d = b; // int -> uint : Fine
    
    const int g; // initialize by zero
    assert(g==0);

    auto f = 3.1415f; // f denotes a float

    // typeid(VAR) returns the type information
    writeln("type of f is ", typeid(f));

    immutable double pi = f; // float -> double is fine

    const float demoted = pi; // For floating vars, down-casting is allowed.

    assert(int.init == 0);
    assert(int.sizeof == 4);
    assert(bool.max == 1);
    writeln(int.min, " ", int.max);
    writeln(int.stringof); // int
}