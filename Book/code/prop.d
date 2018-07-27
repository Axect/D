import std.stdio : writeln;

void main() {
    writeln("Type            : ", int.stringof);
    writeln("Length in bytes : ", int.sizeof);
    writeln("Minimum value   : ", int.min);
    writeln("Maximum value   : ", int.max);
    writeln("Initial value   : ", int.init);
}