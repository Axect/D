import std.stdio;

void main() {
    int[12] monthDays;

    monthDays[11] = 31;

    writeln("January has ", monthDays[0], " days");
}