module tutorial.control.control;

void main() {
    import std.stdio : writeln;

    if (1 == 1)
        writeln("You can trust math in D");

    int c = 5;
    switch(c) {
        case 0: .. case 9:
            writeln(c, " is within 0-9");
            break; // necessary!
        case 10:
            writeln("A Ten!");
            break;
        default: // if nothing else matches
            writeln("Nothing");
            break;
    }
}