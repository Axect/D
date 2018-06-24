module algorithm.sieve;

void main() {
    import std.stdio : writeln;
    markSieve(50).writeln;
}

bool[] markSieve(int l) {
    import std.math : sqrt;
    
    bool[] marks;
    marks.length = l;
    int m = cast(int) sqrt(cast(double)l);

    marks[] = true;
    marks[0] = false;
    marks[1] = true;
    marks[2] = true;

    // Remove even numbers
    foreach(i; 1 .. cast(int) l/2) {
        marks[2*i + 1] = false;
    }

    int n = 3;
    while (n <= m) {
        int factor = 2 * n;
        int multiplier = n + factor;
        while (multiplier <= l) {
            marks[multiplier - 1] = false;
            multiplier += factor;
        }
        ++n;
    }

    return marks;
}